# 🚀 Quick Reference Guide

## Where to Find Things

| I want to...          | Go to...                | File Name              |
| --------------------- | ----------------------- | ---------------------- |
| Change a color        | `lib/core/constants/`   | `app_colors.dart`      |
| Change text/strings   | `lib/core/constants/`   | `app_strings.dart`     |
| Change fonts          | `lib/core/constants/`   | `app_text_styles.dart` |
| Define new data type  | `lib/models/`           | `*_model.dart`         |
| Provide mock data     | `lib/services/`         | `*_service.dart`       |
| Create a full page    | `lib/screens/`          | `*_screen.dart`        |
| Display a single item | `lib/widgets/home/`     | `*_card.dart`          |
| Display collection    | `lib/widgets/sections/` | `*_section.dart`       |
| Shared UI component   | `lib/widgets/common/`   | `*_widget.dart`        |

---

## Add a New Product Section in 5 Steps

### Step 1: Data Model

```dart
// lib/models/my_product_model.dart
class MyProductModel {
  final String image;
  final String title;
  final double price;

  MyProductModel({
    required this.image,
    required this.title,
    required this.price,
  });
}
```

### Step 2: Service (Mock Data)

```dart
// lib/services/my_products_service.dart
import 'package:ecommerceapp/models/my_product_model.dart';

class MyProductsService {
  static final List<MyProductModel> items = [
    MyProductModel(
      image: 'assets/path/image.png',
      title: 'Product Name',
      price: 99.99,
    ),
  ];
}
```

### Step 3: Card Widget

```dart
// lib/widgets/home/my_product_card.dart
import 'package:flutter/material.dart';
import 'package:ecommerceapp/models/my_product_model.dart';

class MyProductCard extends StatelessWidget {
  final MyProductModel item;

  const MyProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(item.image),
        Text(item.title),
        Text('\$${item.price}'),
      ],
    );
  }
}
```

### Step 4: Section Widget

```dart
// lib/widgets/sections/my_products_section.dart
import 'package:flutter/material.dart';
import 'package:ecommerceapp/services/my_products_service.dart';
import 'package:ecommerceapp/widgets/home/my_product_card.dart';

class MyProductsSection extends StatelessWidget {
  const MyProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = MyProductsService.items;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('My Products'),
        const SizedBox(height: 16),
        GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return MyProductCard(item: items[index]);
          },
        ),
      ],
    );
  }
}
```

### Step 5: Add to Home Screen

```dart
// lib/screens/home/home_screen.dart
// ... in the build method ...
const MyProductsSection(),  // ← Just add it!
```

**Done! Your new section appears on the home page.** ✨

---

## Common Tasks

### Change All Button Colors

```dart
// Before: Color(0xFF004CFF) scattered everywhere ❌
// After: Use AppColors ✅

// lib/core/constants/app_colors.dart
static const Color primary = Color(0xFF004CFF);

// lib/widgets/home/my_card.dart
backgroundColor: AppColors.primary,  // ✅ Single source of truth
```

### Change All Heading Text Style

```dart
// lib/core/constants/app_text_styles.dart
static const TextStyle heading2 = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
  fontFamily: "raleway",
);

// lib/widgets/home/my_card.dart
Text("My Title", style: AppTextStyles.heading2)  // ✅ Consistent
```

### Add New String (For Localization Ready)

```dart
// lib/core/constants/app_strings.dart
static const String myNewString = "My Text Here";

// lib/widgets/home/my_card.dart
Text(AppStrings.myNewString)  // ✅ Easy to translate later
```

### Change Service Data

```dart
// lib/services/my_products_service.dart
static final List<MyProductModel> items = [
  // Add or modify items here ✅
  MyProductModel(...),
];
```

---

## File Naming Patterns

```
✅ GOOD NAMES                  ❌ BAD NAMES
────────────────────────────────────────────
category_model.dart            Category.dart
categories_service.dart        service.dart
category_card.dart            card.dart
categories_section.dart       section.dart
login_background.dart         bg.dart
custom_textfield.dart         textfield_impl.dart
camera_upload_widget.dart     camera_upload.dart (no _widget suffix)
flash_sale_model.dart         flash_sales_model.dart (inconsistent plural)
```

---

## Class Naming Patterns

```
✅ GOOD NAMES                  ❌ BAD NAMES
────────────────────────────────────────────
CategoryModel                  Category / CategoryData
CategoriesService             Service / CategoryService
CategoryCard                   Card
CategoriesSection             Section
LoginBackground               LoginBg / Bg
CustomTextfield               CustomTextfield_impl
CameraUploadWidget            CameraUpload
```

---

## Folder Structure at a Glance

```
lib/
├─ core/               ← Global stuff (colors, strings, fonts)
├─ models/             ← Data structures (empty classes)
├─ services/           ← Mock data (where data comes from)
├─ screens/            ← Full pages (use sections + widgets)
├─ widgets/
│  ├─ common/          ← Shared components (textfield, backgrounds)
│  ├─ home/            ← Home-specific cards
│  └─ sections/        ← Layout containers (collections)
└─ main.dart           ← App starts here
```

---

## Import Patterns

### ✅ Correct Order

```dart
// System imports first
import 'dart:io';

// Package imports
import 'package:flutter/material.dart';

// Your app imports
import 'package:ecommerceapp/models/my_model.dart';
import 'package:ecommerceapp/services/my_service.dart';
import 'package:ecommerceapp/widgets/my_widget.dart';
```

### ✅ Correct Imports

```dart
import 'package:ecommerceapp/core/constants/app_colors.dart';
import 'package:ecommerceapp/models/category_model.dart';
import 'package:ecommerceapp/services/categories_service.dart';
import 'package:ecommerceapp/widgets/home/category_card.dart';
import 'package:ecommerceapp/widgets/sections/categories_section.dart';
```

### ❌ Wrong Imports

```dart
import '../models/category_model.dart';        // Use absolute paths
import 'package:ecommerceapp/models/';         // Don't import folders
import 'category_model.dart';                  // Must use package prefix
```

---

## Testing the Refactoring

Run these commands to verify everything works:

```bash
# Get dependencies
flutter pub get

# Check for errors
flutter analyze

# Build for Android (or iOS)
flutter build apk

# Run on device/emulator
flutter run
```

All should pass! ✅

---

## Troubleshooting

| Issue                         | Solution                              |
| ----------------------------- | ------------------------------------- |
| "Target of URI doesn't exist" | Check file path, use absolute imports |
| "Undefined name 'ClassName'"  | Import the file that defines it       |
| "Unused import"               | Remove the import if not needed       |
| "Can't find widget"           | Check file exists in right folder     |
| App looks different           | UI wasn't changed, should look same   |

---

## Performance Tips

| Do                            | Don't                            |
| ----------------------------- | -------------------------------- |
| Use `const` where possible    | Create new objects unnecessarily |
| Keep widgets small & focused  | Put 1000 lines in one file       |
| Extract repeated patterns     | Copy-paste code                  |
| Use sections for organization | Dump everything in home_screen   |
| Keep services lightweight     | Put heavy logic in services      |

---

## Best Practices Checklist

Before committing code:

- [ ] File name is snake_case
- [ ] Class name is PascalCase
- [ ] One responsibility per file
- [ ] No hardcoded colors (use AppColors)
- [ ] No hardcoded strings (use AppStrings)
- [ ] No hardcoded sizes (use constants)
- [ ] Imports are alphabetically sorted
- [ ] No unused imports
- [ ] Comments explain "why", not "what"
- [ ] Consistent with project style

---

## Documentation Files

After refactoring, you have:

1. **REFACTORING_SUMMARY.md** ← Read this first! Overview of changes
2. **REFACTORING_GUIDE.md** ← Detailed guide with learning paths
3. **ARCHITECTURE_DIAGRAM.md** ← Visual diagrams and flows
4. **QUICK_REFERENCE.md** ← This file! Common tasks

---

## Next Learning Steps

### For Beginners

1. Read REFACTORING_SUMMARY.md
2. Explore lib/core/constants/ (understand centralization)
3. Explore lib/models/ (understand data)
4. Explore lib/services/ (understand data providers)
5. Explore lib/widgets/home/ (understand components)

### For Intermediate

1. Add a new product section (follow the 5 steps above)
2. Connect services to real API
3. Add error handling
4. Add loading states

### For Advanced

1. Add state management (Provider/Bloc/Riverpod)
2. Add offline support
3. Add animations
4. Deploy to production

---

## Useful Flutter Commands

```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run

# Format code
dart format .

# Analyze code for issues
flutter analyze

# Check which files have issues
flutter analyze | grep "error"

# Update dependencies
flutter pub upgrade

# Run tests
flutter test
```

---

## File Checklist for New Features

When adding a new product type (e.g., "Bundles"):

```
□ models/bundle_model.dart             ← Define data
□ services/bundles_service.dart        ← Provide data
□ widgets/home/bundle_card.dart        ← Show single
□ widgets/sections/bundles_section.dart ← Show collection
□ Add to home_screen.dart              ← Display on page
□ Run flutter pub get
□ Run flutter analyze (no errors?)
□ Run flutter run (looks good?)
```

---

## Remember

> "Clean code is readable code. Readable code is maintainable code. Maintainable code is professional code."

Your project is now:

- ✅ Clean
- ✅ Readable
- ✅ Maintainable
- ✅ Professional

**Happy coding! 🚀**

---

For more details, see:

- REFACTORING_SUMMARY.md
- REFACTORING_GUIDE.md
- ARCHITECTURE_DIAGRAM.md
