/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import type { PropsWithChildren } from 'react';
import {
  SafeAreaView,
  NativeModules,
  StatusBar,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';

import { Colors } from 'react-native/Libraries/NewAppScreen';

type ActionDeliveryModuleType = {
  startActionDelivery: () => void;
  endActionDelivery: () => void;
};

const ActionDeliveryModule: ActionDeliveryModuleType = NativeModules?.ActionDeliveryModule;

type ButtonProps = PropsWithChildren<{
  title: string;
  action: () => void;
}>;

function Button({ title, action }: ButtonProps): React.JSX.Element {
  return (
    <TouchableOpacity style={styles.buttonStyle} onPress={action}>
      <Text style={styles.buttonLabelStyle}>{title}</Text>
    </TouchableOpacity>
  );
}


function App(): React.JSX.Element {
  const startActivity = () => {
    ActionDeliveryModule.startActionDelivery();
  }

  const endActivity = () => {
    ActionDeliveryModule.endActionDelivery();
  }

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <StatusBar barStyle="dark-content" animated />
      <View style={styles.container}>
        <Text style={{ fontSize: 24, fontWeight: 'bold', marginBottom: 20 }}>Activity Tracker</Text>
        <View style={{ borderBottomColor: 'gray', borderBottomWidth: 1, width: "100%", marginBottom: 12 }} />
        <Text style={{ fontSize: 16, marginBottom: 24 }}>React Native App with Native Live Activities</Text>

        <Button title="Start Activity" action={startActivity} />
        <Button title="End Activity" action={endActivity} />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  buttonStyle: {
    backgroundColor: Colors.primary,
    padding: 12,
    borderRadius: 5,
    width: 200,
    marginBottom: 10,
  },
  buttonLabelStyle: {
    color: Colors.white,
    fontWeight: 'bold',
    fontSize: 16,
    textAlign: 'center',
  },
  container: {
    backgroundColor: Colors.white,
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 24,
  },
});

export default App;
