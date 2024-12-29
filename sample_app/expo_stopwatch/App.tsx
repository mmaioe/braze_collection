import { StatusBar } from 'expo-status-bar';
import { ReactElement,ReactNode} from 'react';
import { StyleSheet, Text, View, TouchableOpacity,Image } from 'react-native';
import { useState } from "react";
import React from 'react';
import Braze, { ContentCard } from "@braze/react-native-sdk";

interface MenuListItemProps {
  children: [ReactElement, ReactElement]
}

export const ButtonMenu = (props: MenuListItemProps) => {
  const { children } = props
  return <View style={styles.buttonMenu}>{children}</View>
}

export default function App() {
  const [timeInfo,setTimeInfo] = useState(0);
  const [stopFlag,setStopFlag] = useState(0);
  const [timeWatchId,setTimeWatchId] = useState(setInterval(() => {}));
  const [topBanner, setTopBanner] = useState<ContentCard>(); // Content Cards for Braze

  Braze.changeUser("stopwatch_test_user_v2")

  Braze.addListener(Braze.Events.CONTENT_CARDS_UPDATED, async (update) => {
    console.log("content cards got updated")

    for (let i = 0; i <update.cards.length; i++) {
      if(update.cards[i].extras["position"] == "top"){
        console.log(update.cards[i])
        setTopBanner(update.cards[i] as ContentCard)
      }
    }
  });

  Braze.requestContentCardsRefresh();
  
  const startTimeWatch = () => {
    setTimeInfo(timeInfo => timeInfo+1)
    console.log(" generateCard runned")

    setTimeWatchId(timeWatchId=>setInterval(() => {
      setTimeInfo( timeInfo => timeInfo+1)
    }, 1000)
    )
  };

  const stopTimeWatch = () => {
    console.log(timeWatchId)
    clearInterval(timeWatchId)
    setTimeInfo(timeInfo=>0)
  };

  return (
    <View style={styles.container}>
      <Text >ここにバナーの画像を入れる。{topBanner?.extras["banner_img_url"]} </Text>
      <Text >{"\n"}{"\n"}</Text>
      <Text >{timeInfo} 秒 (seconds)</Text>
      <ButtonMenu>
        <TouchableOpacity
          onPress={startTimeWatch}
          style={[ styles.button ]}
          activeOpacity={0.8}
        >
          <View style={styles.buttonBorder}>
            <Text style={[ styles.buttonTitle]}>開始{"\n"}Start Watch</Text>
          </View>
        </TouchableOpacity>
        <TouchableOpacity
          onPress={stopTimeWatch}
          style={[ styles.button ]}
          activeOpacity={0.8}
        >
          <View style={styles.buttonBorder}>
            <Text style={[ styles.buttonTitle]}>終了{"\n"}Stop Watch</Text>
          </View>
        </TouchableOpacity>
      </ButtonMenu>
    </View>
  );

}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  button: {
    width: 80,
    height: 80,
    borderRadius: 40,
    justifyContent: 'center',
    alignItems: 'center',
  },
  buttonTitle: {
    fontSize: 10,
    textAlign: 'center'

  },
  buttonBorder: {
    width: 75,
    height: 75,
    borderRadius: 40,
    borderWidth: 5,
    justifyContent: 'center',
    alignItems: 'center',
  },
  buttonMenu: {
    flexDirection: 'row',
    alignSelf: 'stretch',
    justifyContent: 'space-between',
    marginTop: 80,
    marginBottom: 30,
    marginLeft: 100,
    marginRight: 100
  }
});
