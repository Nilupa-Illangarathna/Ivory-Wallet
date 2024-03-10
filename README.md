# ivorywalletsolution

## Contents
### 1. Report about the app
### 2. Screenshots of screens
### 3. Screen Recordings of the app
 
# 1. All the data related to this project can be found inside the following pdf

[19_ENG_033_Final_Report.pdf](https://github.com/Nilupa-Illangarathna/Ivory-Wallet/files/10029657/19_ENG_033_Final_Report.pdf)



### Overview screen

<table>
  <tr>
    <td> Overview screen</td>
     <td> Overview screen</td>
     <td> Overview screen</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404711-1ef062f1-e6d5-4b37-b3b9-9a282a63b6b5.jpg" width=300></td>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404739-5d1a15f6-01c1-402e-9735-7dea9b252028.jpg" width=300></td>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404742-df59e3e7-cb5b-4581-af7b-27ed9a1b77e8.jpg" width=300></td>
  </tr>
 </table>



<table>
  <tr>
    <td> Future predictor screen</td>
     <td> Future predictor screen</td>

  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404933-7759bf6e-0e3f-4266-ac3c-fe4b20861bdf.jpg" width=300></td>
    <td><img src="https://user-images.githubusercontent.com/95247831/205419582-dbe96858-4fc6-42bc-b884-f548b28be774.jpeg" width=300></td>

  </tr>
 </table>

# 3. Screen Recordings of the app


https://user-images.githubusercontent.com/95247831/205420459-6ec970a3-126c-489c-a154-95e4eed75975.mp4


https://user-images.githubusercontent.com/95247831/205420467-063977b7-3678-416a-961f-88e19ddc0c30.mp4

https://user-images.githubusercontent.com/95247831/205420474-1cd709b4-ca4d-483d-baf0-7120d5c17b24.mp4


https://user-images.githubusercontent.com/95247831/205420476-c68869f7-d49d-4f36-8ef9-edb480b2e0e9.mp4

https://user-images.githubusercontent.com/95247831/205420479-0afb8379-c5b9-4736-b917-2f98da83f88d.mp4


https://user-images.githubusercontent.com/95247831/205420497-1c9ac8ee-9c04-43ce-b241-6c5e46c442d9.mp4


https://user-images.githubusercontent.com/95247831/205420507-864d5b28-2465-4e82-86b3-3044d93d6d5c.mp4






























# Ivory Wallet

## CO3302 Computer Engineering Project

**Author:** A.N.L. Illangarathna  
**Date:** October 9, 2022

---

## Abstract

The Ivory Wallet project addresses a pressing issue in Sri Lanka and other countries - economic crisis and the rising cost of necessities. With a focus on managing resources, especially money, this mobile solution aims to empower individuals to navigate the challenges of inflation and make informed financial decisions.

---

## Table of Contents

1. [Introduction](#1-introduction)
   1. [Background](#11-background)
   2. [Main Considerations](#12-main-considerations)
   3. [Objectives](#13-objectives)
   4. [Milestones](#14-milestones)
   5. [Engineering Aspect of this Project](#15-engineering-aspect-of-this-project)

2. [Related Works](#2-related-works)
   1. [Similar Works in Play-store](#21-similar-works-in-play-store)
   2. [Self-made Prediction Model](#22-self-made-prediction-model)

3. [Methodology](#3-methodology)
   1. [Project Scope](#31-project-scope)
   2. [Case Study](#32-case-study)
      1. [Feasibility Analysis](#321-feasibility-analysis)
   3. [Design](#33-design)
      1. [Languages and Development Kit Used](#333-languages-and-development-kit-used)
      2. [Tools Used](#334-tools-used)
      3. [Libraries and Frameworks Used](#335-libraries-and-frameworks-used)
      4. [Database](#336-database)
   4. [Implementation, Unit Testing, and Integration](#34-implementation-unit-testing-and-integration)
   5. [Error Handling](#35-error-handling)
   6. [Testing](#36-testing)
   7. [Deployment](#37-deployment)

4. [Experiments and Results](#4-experiments-and-results)
   1. [Experiments and Results](#41-experiments-and-results)
   2. [First Build Summary](#42-first-build-summary)
   3. [Screenshots of Each Screen](#43-screenshots-of-each-screen)
   4. [Screens Related to Deployment](#44-screens-related-to-deployment)

5. [Future Improvements](#5-future-improvements)

6. [Conclusions](#6-conclusions)

7. [References](#7-references)

---

## 1. Introduction

### 1.1 Background

The Ivory Wallet project emerges as a response to the economic crisis in Sri Lanka, marked by a record-high inflation rate. The escalating cost of necessities, especially food, has necessitated a solution for managing resources effectively. This mobile app focuses on individual financial management as a key step towards alleviating the impact of inflation.

### 1.2 Main Considerations

The project revolves around two main aspects:
1. **Overall Idea about Incomes and Expenses:** Providing users with insights into their daily and monthly expenditures, emphasizing actual data without predictions.
2. **Predicted Summary about the Whole Month:** Utilizing a self-made prediction model, the app forecasts possible total expenses and incomes at the end of the month, empowering users to make informed decisions.

### 1.3 Objectives

The Ivory Wallet project aims to:
- Enhance users' overall lives through effective financial management.
- Facilitate easy entry and monitoring of daily transactions.
- Allow users to share transactions via third-party applications.
- Provide easy access to special transactions for quick reference.
- Set budgets based on users' incomes and offer basic suggestions.
- Offer insights into daily and monthly incomes and expenses.
- Predict possible total expenses and incomes at the end of the month.
- Provide category-wise predicted values for user adjustments.
- Implement rigid suggestions based on current and predicted values.
- Present various types of charts for better user understanding.
- Foster savings, interconnect families, and offer summarized financial reports.

### 1.4 Milestones

The project milestones include gathering relevant information, designing the application, developing front-end and back-end components, database implementation, creating a future prediction model, integration, error handling, and thorough testing.

### 1.5 Engineering Aspect of this Project

The engineering aspect highlights the non-linear prediction model, voice recognition, security measures (fingerprint recognition), and a well-designed user interface with smooth animations for optimal user experience.

---

## 2. Related Works

### 2.1 Similar Works in Play-store

Before development, a case study revealed similar apps in the Play Store, such as "1Money: expense tracker budget," "Money Manager: expense & budget," and "Wallet: Budget Expense Tracker." While these apps shared some features, the Ivory Wallet distinguishes itself by incorporating a prediction model for future financial planning.

### 2.2 Self-made Prediction Model

The Ivory Wallet's prediction model utilizes K-means clustering, frequency considerations, statistics, and interpolation. This model, discussed in the Related Works section, predicts future expenses based on past transactions while addressing potential challenges related to large one-time payments.

# 2. Screenshots of screens
<table>
  <tr>
    <td> Helper screen</td>
     <td> Homescreen</td>
     <td> App drawer</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404483-0999cac6-2d80-4e38-914a-b109d3400336.jpg" width=300></td>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404530-e655fd9f-e8af-458d-933a-953f9951839b.jpg" width=300></td>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404558-88f0cd2e-20bc-42d9-bcb4-b5ae3f9844a4.jpg" width=300></td>
  </tr>
 </table>


<table>
  <tr>
    <td> Expense screen</td>
     <td> Income screen</td>
     <td> Budget setter screen</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404619-90a20e87-9c9e-42f6-9749-dc21b60e30a2.jpg" width=300></td>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404483-0999cac6-2d80-4e38-914a-b109d3400336.jpg" width=300></td>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404908-3e44a6cb-c601-4050-b8fd-fcc9ede73171.jpg" width=300></td>
  </tr>
 </table>


### Settings screen
<img src="[https://user-images.githubusercontent.com/95247831/202404483-0999cac6-2d80-4e38-914a-b109d3400336.jpg](https://user-images.githubusercontent.com/95247831/202404883-08342dc9-d071-4fdd-9437-a6fe033e7e20.jpg)" width= 300>
<!-- ![Screenshot_20221117-143709](https://user-images.githubusercontent.com/95247831/202404883-08342dc9-d071-4fdd-9437-a6fe033e7e20.jpg) --> -->

<table>
  <tr>
    <td> Transaction screen</td>
     <td> Transaction screen</td>
     <td> Settings screen</td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404651-fbdb6459-aafd-4511-872a-cdf23bfcd709.jpg" width=300></td>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404676-99b178a4-d04d-4653-9451-e53172a789c1.jpg" width=300></td>
    <td><img src="https://user-images.githubusercontent.com/95247831/202404483-0999cac6-2d80-4e38-914a-b109d3400336.jpg" width=300></td>
  </tr>
 </table>

## 3. Methodology

### 3.1 Project Scope

The Ivory Wallet project aims to benefit individuals, and the initial release is designed for single-user functionality on both Android and iOS platforms.

### 3.2 Case Study

The case study phase involved analyzing the current country state, defining problems and objectives, and identifying project characteristics. Limitations were acknowledged, and future developments, including voice-to-navigate improvements, were considered.

### 3.3 Design

Agile methodology was employed for the project's flexibility to accommodate future improvements. Adobe XD and Figma were utilized for designing app interfaces, with careful consideration given to colors, animations, and unique widgets.

#### 3.3.1 Languages and Development Kit Used

The primary language used is Dart, with the Flutter development kit employed for application development.

#### 3.3.2 Tools Used

Various tools, including SQLite, Shared Preferences, Firebase for backup, Adobe XD, Figma, Android Studio, and Visual Studio Code, contributed to the development process.

#### 3.3.3 Libraries and Frameworks Used

Several packages from Dart's package repository (pub.dev) were utilized for different purposes, including UI design, animations, secure storage, and database management.

#### 3.3.4 Database

The system utilizes a MySQL database, implemented using the sqflite package. User-related and settings data are stored in the device's shared preferences for offline functionality.

### 3.4 Implementation, Unit Testing, and Integration

The implementation phase involved designing front-end components according to Adobe XD and Figma outputs, creating corresponding back-end parts, and conducting unit testing for isolated components. Integration followed, with simultaneous development of the database.

### 3.5 Error Handling

A significant focus was placed on error handling during isolated testing and after integration. User input validation measures were implemented to ensure accurate and secure data entry, addressing potential issues with character limits, negative values, and special characters.

### 3.6 Testing

Testing occurred in two stages: isolated testing during component development and integration testing to ensure seamless functionality across the entire application. Alpha and beta testing involved the use of dummy data and real users, respectively, to refine the application based on feedback.

### 3.7 Deployment

After finalizing the initial release, the application was published on Google Play Store and the Apple App Store. Users can download the application, create user accounts, and access features such as rating the app, providing feedback, contacting support, inviting friends, and resetting app data.

---

## 4. Experiments and Results

### 4.1 Experiments and Results

Several experiments were conducted on the prediction model, considering different user inputs and scenarios. The accuracy and behavior of the model were analyzed in various situations, leading to insights and possible solutions.

### 4.2 First Build Summary

The first build of the Ivory Wallet includes essential features such as helper screens, authentication, transaction addition, category management, voice typing, editing, deleting, and sharing transactions, and budget setting. An overview section provides insights into daily, budget, and weekly summaries, along with predictions categorized by expense type. Additional features include dark theme support and customization options.


### 4.4 Screens Related to Deployment

[Insert screenshots of contact us, feedback, and invite friends screens.]

---

## 5. Future Improvements

1. **SMS to Transactions Automatically:** Enable the application to read income and expense-related data from SMS messages with user permission, ensuring privacy is maintained.
2. **Connecting Families:** Allow multiple accounts to be connected, generating brief reports and prediction summaries for the entire family.
3. **Fully Voiced Application:** Implement voice navigation throughout the app, enabling users to perform tasks using speech-to-text and text highlighting.
4. **Improving Dark Theme:** Enhance the current dark theme by carefully selecting and improving color choices.

---

## 6. Conclusions

The Ivory Wallet application successfully addresses the economic challenges faced by individuals, providing a comprehensive solution for managing finances. The developed functionalities align with the project's objectives, contributing to an improved overall quality of life for users.

---

## 7. References

1. Sri Lanka Inflation Rate - September 2022 Data - 1986-2021 Historical. (2022, October 09). [Trading Economics](https://tradingeconomics.com/sri-lanka/inflation-cpi)
2. Dart packages. (2022, October 09). [Pub.dev](https://pub.dev)
3. Flutterforum.co. (2022, October 09). [Flutter Forum](https://flutterforum.co)
4. GitHub: Where the world builds software. (2022, October 09). [GitHub](https://github.com)
5. Youtube. (2022, October 09). [YouTube](https://www.youtube.com)
6. Flutter-bootcamp-with-dart. (2022, October 09). [Udemy](https://www.udemy.com/course/flutter-bootcamp-with-dart/?utm_source=adwords&utm_medium=udemyads&utm_campaign=GoogleFlutter+v.PROF+la.EN+cc.ROW&utm_content=deal4584&utm_term=.ag121857711297.ad535699942216.kw+google+flutter+online+class.de+c.dm.pl.ti+dsa-1184741605146.li+1009919.pd.&matchtype=b&gclid=Cj0KCQiA47GNBhDrARIsAKfZ2rA0flES32hPOPkqe2URwvScw58PzdoJFitVvCznKqyPYGpp7MlAdsoaAryNEALwwcB)
7. Getting started with Flutter Circular Charts widget — Syncfusion. (2022, October 09). [Syncfusion](https://help.syncfusion.com/flutter/circular-charts/getting-started)

---

**Note:** For more information and support, visit the [Ivory Wallet Forum](https://ivorywalletforum.example).
