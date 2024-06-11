# fancy_onboarding_screen

<table>
    <tr>
        <td>
            <img src="https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png" alt="Flutter Logo" height="30">
        </td>
        <td>
            fancy_onboarding_screen
        </td>
    </tr>
</table>

<table>
  <tr>
    <th>Pub Version</th>
    <th>Pub Points</th>
  </tr>
  <tr><td>Pub v1.0.0</td> <td>140/160</td></tr>
</table>


## Demo
![demo](https://github.com/javedmughal-058/fancy_onboarding_screen/assets/91019922/54f62e30-bfb1-476e-a0c2-e017e1ad0678)



## Supports
<table>
    <tr>
        <th>Platform Support</th>
        <th>Android</th>
        <th>iOS</th>
        <th>MacOS</th>
        <th>Web</th>
        <th>Linux</th>
        <th>Windows</th>
    </tr>
    <tr>
        <td></td>
        <td><span class="checkmark">&#10004;</span></td>
        <td><span class="checkmark">&#10004;</span></td>
        <td><span class="checkmark">&#10004;</span></td>
        <td><span class="checkmark">&#10004;</span></td>
        <td><span class="checkmark">&#10004;</span></td>
        <td><span class="checkmark">&#10004;</span></td>
    </tr>
</table>

## Features

fancy_onboarding_screen package is very easy to integrate into your project. Simply follow the steps below:

## Getting started

Install fancy_onboarding_screen Package:

```
$ flutter pub add fancy_onboarding_screen 
```

or

```
dependencies:
    flutter:
      sdk: flutter
    fancy_onboarding_screen:
```

## Usage
```
import 'package:fancy_onboarding_screen/fancy_onboarding_screen.dart';
```

## Examples

```
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FancyOnBoardingScreen(),
      ),
    );
  }
}
```

The provided code creates a beautiful and fancy onboarding screen, which includes:
* Dummy items for demonstration purposes
* The option to create your own items to customize the onboarding screen to your needs
* The option to change heading, sub heading and relevant styles as well.

## Customize the fancy onboarding screen
By using these optional parameters you can customize the onboarding screen

```
List<OnBoardingItemModel> boardingItemsList = [
      OnBoardingItemModel(
        title: 'Write your title',
        subtitle: 'Sub title one!',
        image: 'assets/images/onboard_image_1.png',
      ),
      OnBoardingItemModel(
        title: 'Write your second title',
        subtitle: 'Sub title second!',
        image: 'assets/images/onboard_image_2.png',
      ),
      OnBoardingItemModel(
        title: 'Write your third title',
        subtitle: 'Sub title third!',
        image: 'assets/images/onboard_image_3.png',
      ),
    ];
```
To use OnBoardingItemModel, include the following import:

```import 'package:fancy_onboarding_screen/core/model/onboarding_item_model.dart';```

Now assign your declared list to onBoardingItems parameter

![fboard_image](https://github.com/javedmughal-058/fancy_onboarding_screen/assets/91019922/60874b93-ec5f-4da9-9973-24b82de283d5)



## ✌ Contributing
We welcome contributions to this package! Please feel free to fork the repository and submit your pull requests..

## 🚀 About Me
<p>"Hi I am <a href="https://github.com/javedmughal-058" rel="ugc">Muhammad Javed</a>  a Full Stack Flutter developer".</p>

