# BMI Calculator 🏋️‍♂️📊

A sleek, beautiful, and interactive Flutter application designed to calculate Body Mass Index (BMI). The application uses custom styling, dynamic widgets, and clean calculations to offer a premium user experience.

---

## ✨ Features

- **Interactive Gender Selection**: Choose between Male and Female with active/inactive card states.
- **Dynamic Height Slider**: Smooth slider adjustment for height between 120cm and 220cm.
- **Age & Weight Adjusters**: Increment and decrement controls to customize input metrics.
- **Custom Themes**: Sleek dark mode design with custom-themed widgets (e.g., active/inactive card colors, bespoke slider themes).
- **Instant BMI Calculation**: Computes and displays the BMI along with category classification (Underweight, Normal, Overweight) and custom fitness recommendations.

---

## 🛠️ Tech Stack & Structure

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **Icons**: [Font Awesome Flutter](https://pub.dev/packages/font_awesome_flutter)

### Project Directory Layout

* [lib/main.dart](file:///c:/Users/vijay/Documents/viji/bmi_cal/lib/main.dart) - App Entry Point & Theme definition
* [lib/input_page.dart](file:///c:/Users/vijay/Documents/viji/bmi_cal/lib/input_page.dart) - Main User Interface with controls
* [lib/result.dart](file:///c:/Users/vijay/Documents/viji/bmi_cal/lib/result.dart) - Results display page
* [lib/calculator_brain.dart](file:///c:/Users/vijay/Documents/viji/bmi_cal/lib/calculator_brain.dart) - Business logic for BMI computing
* [lib/reusable_card.dart](file:///c:/Users/vijay/Documents/viji/bmi_cal/lib/reusable_card.dart) - Custom reusable container card
* [lib/icon_content.dart](file:///c:/Users/vijay/Documents/viji/bmi_cal/lib/icon_content.dart) - Custom icon container widget
* [lib/constants.dart](file:///c:/Users/vijay/Documents/viji/bmi_cal/lib/constants.dart) - Unified style constants (colors, text styles)

---

## 🚀 Getting Started

To run this application locally, follow these steps:

### Prerequisites

Make sure you have Flutter installed and configured on your system. You can verify this by running:
```bash
flutter doctor
```

### Installation & Run

1. Clone or navigate to the repository directory:
   ```bash
   cd bmi_cal
   ```

2. Fetch the required dependencies:
   ```bash
   flutter pub get
   ```

3. Launch the application on an emulator or connected device:
   ```bash
   flutter run
   ```

---

## 📐 BMI Formula & Logic

The BMI is calculated using the standard formula:

$$\text{BMI} = \frac{\text{Weight (kg)}}{\left(\frac{\text{Height (cm)}}{100}\right)^2}$$

Categories:
- **Underweight**: BMI < 18.5
- **Normal**: 18.5 ≤ BMI < 25
- **Overweight**: BMI ≥ 25