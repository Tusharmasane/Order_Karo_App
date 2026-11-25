plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.order_karo_app"

    // Let Flutter manage these where possible
    compileSdk = flutter.compileSdkVersion
    // ❌ Remove ndkVersion unless you really use C/C++ (prevents CMake requirement)
    // ndkVersion = "27.0.12077973"

    // Java/Kotlin toolchains – use 17 for modern Flutter/AGP
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.example.order_karo_app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // If you ever need MultiDex (large method count), uncomment:
        // multiDexEnabled = true
    }

    buildTypes {
        debug {
            // Keep shrink off in debug to avoid the AGP check
            isMinifyEnabled = false
            isShrinkResources = false
        }
        release {
            // For now keep off; enable both together later if you need shrinking
            isMinifyEnabled = false
            isShrinkResources = false
            signingConfig = signingConfigs.getByName("debug")
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro",
            )
        }
    }

    // Optional: avoid packaging warnings if you add libs later
    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // If you enable MultiDex above:
    // implementation("androidx.multidex:multidex:2.0.1")
}