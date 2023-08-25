# Innowise Program

## Design Patterns
- Builder 
- Singleton 
- Factory Method
- Facade
- Observer

<div align="center">

<video src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/3515a09d-21fb-407b-84de-8502301dc71c" width="230" height="500">
    
</div>

## UI
### Design
- Center elements

<div align="center">

| Center elements |
|:---------------:|
| <img src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/3d71021c-d4ba-4a4e-be87-bcd2216b403b" width="230" height="500"> |
    
</div>

- Scroll view

<div align="center">

| iPhone 14 Pro   |    iPhone 8     |
|:---------------:|:---------------:|
| <img src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/29b5445d-0c1d-4e1a-b4cd-beac643789d2" width="230" height="500"> | <img src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/878cef8f-4e53-4b76-82f7-9face81f938a" width="230" height="500"> |
    
</div>

- Z-order & relative sizes

<div align="center">

| Z-order & relative sizes |
|:------------------------:|
| <img src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/214294bf-7ffb-47bf-a69c-38b442a4628a" width="230" height="500"> |
    
</div>

- Z-order & pipette

<div align="center">

| Z-order & pipette |
|:-----------------:|
| <img src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/06bfa8bb-c56a-4b98-af3b-f5d3e683f07a" width="230" height="500"> |
    
</div>

- Make UI from layout

<div align="center">

| Make UI from layout |
|:-------------------:|
| <img src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/c1f27fdc-097f-42cc-9906-a7d2d3242b7d" width="230" height="500"> |
    
</div>

- Dynamic UI changes

<div align="center">

<video src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/8f303dcc-cbcb-415a-b64d-ade620162d0b" width="230" height="500">
    
</div>

- Compound view

<div align="center">

<video src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/c21f748e-a9fb-4104-877d-aae5144df65b" width="230" height="500">
    
</div>

- Custom progress bar

<div align="center">

<video src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/fa8fe995-8aec-4772-b1e4-88926eee1872" width="230" height="500">
    
</div>

### Lists
#### Features
- 4 different lists
- Load images via Alamofire
- Swipe to refresh
- Empty view

<div align="center">

|  First Screen  |  Second Screen  |  Third Screen  |  Fourth Screen  |
|:--------------:|:---------------:|:--------------:|:---------------:|
| <img src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/474204c4-2599-44c4-8ae5-b044d1266112" width="205" height="442"> | <img src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/8a644c95-88db-4ca5-abb2-c5d71405e805" width="205" height="442"> | <img src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/b9f6e3f1-7822-4334-a2e7-a0b8f1a434dc" width="205" height="442"> | <img src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/f54fe443-0c50-42ea-aa87-0ce50ef1b55f" width="205" height="442"> |

<video src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/b14450c7-8253-47eb-af8d-7253604da84b" width="120" height="260">
    
</div>

## Lifecycle
- Application lifecycle
- Application with logic within the lifecycle
### Features
- Dynamic drawable
- Update by specific events (Close, Resume, Update, etc.)
  
<div align="center">
  
<video src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/28488636-cdfd-4f04-9272-f429e18f4501" width="230" height="500">
      
</div>
  
## Multithreading
- Chronometer
### Features
- Update Label with seconds every second
- Show Toast with seconds every 10 seconds
- Replaces the text with seconds with "Surprise" every 4 displays of Toast

<div align="center">
  
<video src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/89b06b8d-1973-48e4-8b44-76a8593f408e" width="230" height="500">
      
</div>

- Multithreading ships
### Task
 - There is a tunnel that can hold up to 5 ships
 - There are 3 types of ships: Bananas, Bread, Clothes
 - There are 3 types of capacity: 10, 50, 100
 - There are 3 types of docks: Bananas, Bread, Clothes
 - Each pier loads 10 pieces per second
 
 ### Features
 - Information about ships, tunnels and goods that are currently in the system is displayed in labels
 - Threads are inactive if there are no tasks
 - The operation of the ship generator doesn't depend on the operation of the piers and vice versa
 - Threads are synchronized
 
 <div align="center">
  
<video src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/0d56a1c6-eba5-4af6-b242-897933464cf6" width="230" height="500">
      
</div>

- Racing

A console application that simulates racing in a circle. The races involve different types of vehicles: trucks, cars and motorcycles. All vehicles start at the same time, pass one lap and stop. As soon as all of them stop, the application displays the championship table and asks the user if he wants to send them one more lap.

Each of the vehicles has its own speed and the probability of a punctured wheel. When the wheel is punctured, the vehicle stops for a while and reports the puncture to the console.

Before starting to move, each vehicle writes its own parameters to the console: the speed and probability of a punctured wheel. Additionally, the truck must write what its cargo weight is, the passenger car – how many people are in it, and the motorcycle – whether it has a wheelchair. While driving, each vehicle writes what distance it has already traveled.

The number and types of vehicles, their parameters and the length of the circle are read through the inputs.

 ### Features
 - Implementation via Async/await & Thread
 
<details>
<summary>Output</summary>

```
Enter the number of vehicles (2 to 10):
3
Please select the vehicle type:
1. Car
2. Bike
3. Truck
1
Enter the number of people in the car:
4
Enter car speed:
4
Enter car puncture chance:
6
Please select the vehicle type:
1. Car
2. Bike
3. Truck
2
Does the bike have a sidecar? [Y/N]:
Y
Enter bike speed:
3
Enter bike puncture chance:
8
Please select the vehicle type:
1. Car
2. Bike
3. Truck
3
Enter truck weight capacity:
200
Enter truck speed:
2
Enter truck puncture chance:
7
Enter the race distance in kilometers (5 to 100):
10
==========================About Race=========================
Race distance: 10 kilometers
Number of racers: 3
Id: 1, Type: Car, Speed: 4, People in car: 4
Id: 2, Type: Bike, Speed: 3, Sidecar: Yes
Id: 3, Type: Truck, Speed: 2, Weight: 200
===========================Log Race==========================
-------------------------------------------------------------
|   Id   |     Type     |    Current distance(km)/Broken    |
-------------------------------------------------------------
|   1    |     Car      |                0.8                |
|   1    |     Car      |                0.8                |
|   3    |    Truck     |                0.2                |
|   2    |     Bike     |                0.3                |
|   1    |     Car      |    Broken, Pit Stop 2 seconds     |
|   1    |     Car      |                1.2                |
|   2    |     Bike     |    Broken, Pit Stop 3 seconds     |
|   3    |    Truck     |                0.4                |
|   1    |     Car      |                1.6                |
|   3    |    Truck     |                0.6                |
|   1    |     Car      |                2.0                |
|   3    |    Truck     |    Broken, Pit Stop 3 seconds     |
|   1    |     Car      |                2.4                |
|   1    |     Car      |                2.8                |
|   1    |     Car      |                3.2                |
|   1    |     Car      |                3.6                |
|   1    |     Car      |                4.0                |
|   1    |     Car      |                4.4                |
|   1    |     Car      |                4.8                |
|   1    |     Car      |                5.2                |
|   1    |     Car      |                5.6                |
|   1    |     Car      |                6.0                |
|   1    |     Car      |                6.4                |
|   1    |     Car      |                6.8                |
|   1    |     Car      |                7.2                |
|   1    |     Car      |                7.6                |
|   1    |     Car      |                8.0                |
|   1    |     Car      |                8.4                |
|   1    |     Car      |                8.8                |
|   1    |     Car      |                9.2                |
|   1    |     Car      |                9.6                |
|   1    |     Car      |               10.0                |
|   2    |     Bike     |                0.6                |
|   2    |     Bike     |                0.9                |
|   2    |     Bike     |                1.2                |
|   2    |     Bike     |                1.5                |
|   2    |     Bike     |                1.8                |
|   2    |     Bike     |                2.1                |
|   2    |     Bike     |                2.4                |
|   2    |     Bike     |                2.7                |
|   2    |     Bike     |                3.0                |
|   2    |     Bike     |                3.3                |
|   2    |     Bike     |                3.6                |
|   2    |     Bike     |                3.9                |
|   2    |     Bike     |                4.2                |
|   3    |    Truck     |                0.8                |
|   2    |     Bike     |                4.5                |
|   2    |     Bike     |                4.8                |
|   3    |    Truck     |                1.0                |
|   2    |     Bike     |                5.1                |
|   2    |     Bike     |                5.4                |
|   3    |    Truck     |                1.2                |
|   2    |     Bike     |                5.7                |
|   2    |     Bike     |                6.0                |
|   3    |    Truck     |                1.4                |
|   2    |     Bike     |                6.3                |
|   3    |    Truck     |                1.6                |
|   2    |     Bike     |                6.6                |
|   2    |     Bike     |                6.9                |
|   3    |    Truck     |                1.8                |
|   2    |     Bike     |                7.2                |
|   2    |     Bike     |                7.5                |
|   2    |     Bike     |                7.8                |
|   3    |    Truck     |                2.0                |
|   2    |     Bike     |                8.1                |
|   2    |     Bike     |                8.4                |
|   3    |    Truck     |                2.2                |
|   2    |     Bike     |                8.7                |
|   3    |    Truck     |                2.4                |
|   2    |     Bike     |                9.0                |
|   2    |     Bike     |                9.3                |
|   3    |    Truck     |                2.6                |
|   2    |     Bike     |    Broken, Pit Stop 3 seconds     |
|   2    |     Bike     |                9.6                |
|   3    |    Truck     |                2.8                |
|   2    |     Bike     |                9.9                |
|   3    |    Truck     |                3.0                |
|   2    |     Bike     |               10.0                |
|   3    |    Truck     |                3.2                |
|   3    |    Truck     |                3.4                |
|   3    |    Truck     |                3.6                |
|   3    |    Truck     |                3.8                |
|   3    |    Truck     |                4.0                |
|   3    |    Truck     |                4.2                |
|   3    |    Truck     |                4.4                |
|   3    |    Truck     |                4.6                |
|   3    |    Truck     |                4.8                |
|   3    |    Truck     |                5.0                |
|   3    |    Truck     |                5.2                |
|   3    |    Truck     |                5.4                |
|   3    |    Truck     |    Broken, Pit Stop 3 seconds     |
|   3    |    Truck     |    Broken, Pit Stop 3 seconds     |
|   3    |    Truck     |                5.6                |
|   3    |    Truck     |                5.8                |
|   3    |    Truck     |                6.0                |
|   3    |    Truck     |                6.2                |
|   3    |    Truck     |                6.4                |
|   3    |    Truck     |                6.6                |
|   3    |    Truck     |                6.8                |
|   3    |    Truck     |                7.0                |
|   3    |    Truck     |                7.2                |
|   3    |    Truck     |                7.4                |
|   3    |    Truck     |                7.6                |
|   3    |    Truck     |                7.8                |
|   3    |    Truck     |                8.0                |
|   3    |    Truck     |                8.2                |
|   3    |    Truck     |                8.4                |
|   3    |    Truck     |                8.6                |
|   3    |    Truck     |                8.8                |
|   3    |    Truck     |                9.0                |
|   3    |    Truck     |                9.2                |
|   3    |    Truck     |                9.4                |
|   3    |    Truck     |                9.6                |
|   3    |    Truck     |                9.8                |
|   3    |    Truck     |               10.0                |
|   3    |    Truck     |               10.0                |
-------------------------------------------------------------
=========================Race Results========================
Time: 4 seconds - Id: 1, Type: Car, Speed: 4, People in car: 4
Time: 9 seconds - Id: 2, Type: Bike, Speed: 3, Sidecar: Yes
Time: 14 seconds - Id: 3, Type: Truck, Speed: 2, Weight: 200
One more lap? [Y/N]:
N
```
</details>

## NearEats (Foursquare API)
### Features
- File system for storing data
- OAuth 2.0
- AsyncImage for loading images
- Custom tab bar
- NWPathMonitor to monitor the network status
- Search for bars and restaurants
- Information about the institution
- Place tips
- Image slider
- Splash screen

<div align="center">
  
<video src="https://github.com/undertaker28/InnowiseProgram/assets/69767713/8f848ccb-5115-46f2-bfe5-b40f50ea1437" width="230" height="500">
      
</div>
