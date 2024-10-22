import React from 'react';
import { View, Text, StyleSheet, FlatList, TouchableOpacity, Image } from 'react-native';
import Icon from 'react-native-vector-icons/FontAwesome';

const accounts = [
  { key: 'Instagram', icon: 'instagram', color: '#C13584' },
  { key: 'Facebook', icon: 'facebook', color: '#3b5998' },
  { key: 'Snapchat', icon: 'snapchat-ghost', color: '#FFFC00' },
  { key: 'Twitter', icon: 'twitter', color: '#1DA1F2' },
];

const Item = ({ title, iconName, iconColor }) => (
  <TouchableOpacity style={styles.item}>
    <Icon name={iconName} size={30} color={iconColor} style={styles.icon} />
    <Text style={styles.title}>{title}</Text>
    <Icon name="angle-right" size={30} color="#ccc" />
  </TouchableOpacity>
);

const DashboardScreen = () => {
  const renderItem = ({ item }) => (
    <Item title={item.key} iconName={item.icon} iconColor={item.color} />
  );

  return (
    <View style={styles.container}>
      <Text style={styles.header}>SafeSphere</Text>
      <Text style={styles.subheader}>My Accounts</Text>
      <FlatList
        data={accounts}
        renderItem={renderItem}
        keyExtractor={item => item.key}
      />
      <TouchableOpacity style={styles.button}>
        <Text style={styles.buttonText}>Custom Privacy Rules</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button}>
        <Text style={styles.buttonText}>Manage Privacy Profiles</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    backgroundColor: '#ffffff',
  },
  header: {
    fontSize: 30,
    fontWeight: 'bold',
    marginBottom: 10,
  },
  subheader: {
    fontSize: 20,
    color: '#555',
    marginTop: 20,
    marginBottom: 10,
  },
  item: {
    flexDirection: 'row',
    padding: 10,
    alignItems: 'center',
    borderBottomWidth: 1,
    borderColor: '#ccc',
  },
  icon: {
    marginRight: 10,
  },
  title: {
    fontSize: 18,
    flex: 1,
  },
  arrow: {
    fontSize: 18,
    color: '#ccc',
  },
  button: {
    backgroundColor: '#ddd',
    padding: 15,
    marginTop: 10,
  },
  buttonText: {
    textAlign: 'center',
    fontSize: 18,
  },
});

export default DashboardScreen;
