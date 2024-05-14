## e-motion-mobile

### Prerequisities

- **Flutter** (version 3.19.6 or higher)

#### For Android development:
- **Android SDK** (version 34.0.0 or higher)

#### For iOS development
- **iOS** (version 17.4 or higher)

### Local development

Check flutter installation:
```shell
flutter doctor
```

Clone the repository:
```shell
git clone https://github.com/blumilksoftware/e-motion-mobile
```
Copy .env.example:
```shell
cp .env.example .env
```

Download necessary dependencies (packages):
```shell
flutter pub get
```

Build code generated files:
```shell
dart run build_runner build
```

To start the project run:
```shell
flutter run
```

Lint code:
```shell
dart fix --apply
```