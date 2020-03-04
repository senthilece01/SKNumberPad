# SKNumberPad

Fast and easy to use custom number pad library for Flutter
  
 [![Flutter](https://img.shields.io/badge/Platform-Flutter-blue.svg)](https://flutter.dev/)

## GIF
![SKNumberPadDemo](https://user-images.githubusercontent.com/10756609/75851195-0afb8e80-5e0f-11ea-84a0-08d12b8ac018.gif)

## 💻 Installation

You just need to add `sk_number_pad` as a [dependency in your pubspec.yaml file.](https://flutter.dev/docs/development/packages-and-plugins/using-packages)

```yaml
dependencies:
sk_number_pad: ^1.0.0
```

## Usage

### Import this class

```dart
import 'package:sk_numberpad/sk_number_pad.dart';
```

## SKNumberPadWidget

```dart
@override
Widget build(BuildContext context) {
  // TODO: implement build
  return Scaffold(
    body:SkNumberPad(
      bgColor: ColorsUtils.orange,
      textColor: Colors.white,
      selectedNo: (value) {
        print(value);
      },
      doneSelected: (value) {
        print('Done Selected');
      },
    )
  );
}
```


## 📃License

    Copyright 2020, Senthil Kumar

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
