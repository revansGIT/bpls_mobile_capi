# BPLS Mobile

A cross-platform mobile application built with Flutter for agricultural survey and data collection in Bangladesh.

## Overview

BPLS Mobile is a comprehensive field data collection app designed to gather agricultural information about various crops and livestock. The app supports offline data collection with local storage and background synchronization capabilities.

## Key Features

- 📱 **Multi-crop Survey Support**: Collect data for rice varieties (Amon, Boro, Aus), vegetables (onion/পেঁয়াজ, lentils/মসুর, mustard/সরিষা, potatoes/আলু, mango/আম), and livestock (cow, hen, shrimp/চিংড়ি, carp fish)
- 📍 **Location Services**: GPS-based location tracking and geocoding for accurate field mapping
- 📷 **Camera Integration**: Capture photos during field surveys
- 💾 **Offline-First Architecture**: Local data storage using Hive with background synchronization
- 🌐 **Bengali Language Support**: Custom Noto Sans Bengali font integration
- 🎨 **Responsive UI**: Adaptive layouts using Flutter ScreenUtil
- 🔄 **State Management**: Provider pattern for efficient state handling
- 🔐 **Authentication**: Secure user authentication system

## Tech Stack

- **Framework**: Flutter 3.9.2+
- **State Management**: Provider, GetX
- **Local Storage**: Hive
- **Networking**: Dio
- **Architecture**: Clean architecture with dependency injection
- **UI Components**: Material Design with custom theming

## Dependencies

Core packages include:
- `provider` - State management
- `get` - Navigation and utilities
- `hive_ce` - Local database
- `dio` - HTTP client
- `camera` - Image capture
- `geolocator` & `geocoding` - Location services
- `workmanager` - Background task scheduling
- `connectivity_plus` - Network status monitoring

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Create a `.env` file in the root directory
4. Run `flutter run` to start the app

## Platform Support

- ✅ Android