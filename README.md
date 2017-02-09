# GeoApp for iOS

**!! WARNING : macOS Sierra (10.12) and Xcode 8 are needed to run this project (No Windows allowed) !!**

1. Up first, you need to install CocoaPods. It is a package manager to add frameworks to the iOS GeoApp.

To install it, go [here](https://cocoapods.org).

2. Next, clone the project and go in the folder.

```bash
git clone https://github.com/601-H17/GeoApp-iOS.git
cd the_project/
```

3. Install all dependencies.

```bash
pod install
```

4. Then you can open the project with the `GeoApp-iOS.xcworkspace`

### API key for GeoApp

1. For the app to work, you need to add the api key. Get one on the deployed server.

2. Create a new `.plist`file.
```
File > New > File... (cmd+N)
```

3. In the window, scroll down to `Resource` and select `Property List`. Click next.

4. Name the file `ApiKey` and place it in `GeoApp-iOS/Model/Supporting\ files/`. Click create.

5. Go to the file, and open it.

6. Right-click on Root and click `Add Row`.

7. Key is `API_SECRET` and add your api key to the value.