# 📊 Flutter E-Commerce App - Architecture Diagram

## Data Flow Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                         USER SEES                           │
│                      (home_screen.dart)                     │
└───────────────────────────────┬─────────────────────────────┘
                                │
                    ┌───────────┴───────────┐
                    │                       │
        ┌───────────▼──────────┐  ┌────────▼────────────┐
        │   Screen Sections    │  │   Home Widgets      │
        │  (widgets/sections)  │  │   (widgets/home)    │
        └───────────┬──────────┘  └────────┬────────────┘
                    │                      │
        ┌───────────┴──────────────────────┴────────────┐
        │                                                │
        │  CategoriesSection          PopularProductsSection
        │  FlashSaleSection           NewItemsSection
        │  JustForYouSection          TopProductsSection
        │
        └───────────┬──────────────────────┬────────────┐
                    │                      │            │
        ┌───────────▼──────────┐ ┌─────────▼────────┐  │
        │   Card Widgets       │ │  Common Widgets  │  │
        │  (widgets/home)      │ │  (widgets/common)│  │
        └───────────┬──────────┘ └──────────────────┘  │
                    │                                  │
        ┌───────────▼──────────────────────────────────┘
        │
        │  CategoryCard          FlashSaleCardWidget
        │  PopularProductCard    JustForYouItemCard
        │  NewItemCard           CustomTextfield
        │
        └───────────┬─────────────────────────────────────┐
                    │                                     │
        ┌───────────▼──────────┐             ┌───────────▼────────┐
        │   Service Layer      │             │   Core Constants   │
        │  (lib/services)      │             │   (lib/core)       │
        └───────────┬──────────┘             └───────────┬────────┘
                    │                                    │
        ┌───────────▼──────────┐             ┌───────────▼────────┐
        │   Model Classes      │             │   Colors           │
        │  (lib/models)        │             │   Strings          │
        └──────────────────────┘             │   TextStyles       │
                                             └────────────────────┘
         ↑
         │ (Service provides)
         │
    [Mock/Real Data]
```

---

## Folder Organization Map

```
lib/
│
├─ 📦 core/                    ← GLOBAL SETTINGS
│  ├─ constants/
│  │  ├─ 🎨 app_colors.dart   ← All colors centralized
│  │  ├─ 📝 app_strings.dart  ← All text centralized
│  │  └─ ✍️ app_text_styles.dart ← All fonts centralized
│  └─ theme/
│
├─ 📊 models/                  ← DATA STRUCTURES (NO LOGIC)
│  ├─ 📋 category_model.dart
│  ├─ 📋 flash_sale_model.dart
│  ├─ 📋 popular_product_model.dart
│  ├─ 📋 just_for_you_item_model.dart
│  ├─ 📋 new_item_model.dart
│  ├─ 📋 product_model.dart
│  ├─ 📋 story_model.dart
│  ├─ 📋 top_product_model.dart
│  └─ 👤 user_model.dart
│
├─ 💾 services/                ← MOCK DATA PROVIDERS
│  ├─ 📥 categories_service.dart
│  ├─ 📥 flash_sales_service.dart
│  ├─ 📥 popular_products_service.dart
│  ├─ 📥 just_for_you_service.dart
│  ├─ 📥 new_items_service.dart
│  ├─ 📥 recently_viewed_service.dart
│  ├─ 📥 stories_service.dart
│  └─ 📥 top_products_service.dart
│
├─ 🖼️ screens/                 ← FULL PAGE SCREENS
│  ├─ 🚀 start/
│  │  └─ 📄 start_screen.dart      (Entry point)
│  │
│  ├─ 🔐 auth/
│  │  ├─ 📄 login_screen.dart
│  │  ├─ 📄 create_account_screen.dart
│  │  ├─ 📄 password_screen.dart
│  │  └─ 📄 otp_screen.dart
│  │
│  ├─ 🎁 onboarding/
│  │  ├─ 📄 onboarding_screen.dart  (Main container)
│  │  ├─ 📄 hello_card_screen.dart  (First card)
│  │  └─ 📄 ready_card_screen.dart  (Last card)
│  │
│  ├─ 🏠 home/
│  │  ├─ 📄 home_screen.dart        (Main page - uses sections)
│  │  ├─ 📄 cart_screen.dart
│  │  ├─ 📄 favorites_screen.dart
│  │  └─ 📂 home_section/           (Section layouts)
│  │     ├─ categories_section.dart
│  │     ├─ flash_sale_section.dart
│  │     └─ ...
│  │
│  └─ 📦 orders/
│     └─ 📄 orders_screen.dart
│
├─ 🧩 widgets/                 ← REUSABLE UI COMPONENTS
│  ├─ 🔧 common/
│  │  ├─ 📝 custom_textfield.dart     (Input field)
│  │  ├─ 📷 camera_upload_widget.dart (Image picker)
│  │  ├─ 🖼️ login_background.dart
│  │  ├─ 🖼️ otp_background.dart
│  │  ├─ 🖼️ hello_card_background.dart
│  │  └─ 🖼️ background_shapes.dart
│  │
│  ├─ 🏪 home/
│  │  ├─ 🎴 category_card.dart           (One category)
│  │  ├─ 🎴 flash_sale_card.dart         (One sale item)
│  │  ├─ 🎴 popular_product_card.dart    (One popular)
│  │  ├─ 🎴 just_for_you_item_card.dart  (One recommendation)
│  │  ├─ 🎴 new_item_card.dart           (One new item)
│  │  ├─ 👤 profile_header.dart
│  │  ├─ 📰 announcement_card.dart
│  │  ├─ 📖 story_card.dart
│  │  └─ 🏷️ order_chip.dart
│  │
│  └─ 📑 sections/               ← COLLECTION LAYOUTS
│     ├─ 📋 categories_section.dart      (Grid + title)
│     ├─ 📊 flash_sale_section.dart      (Grid + timer)
│     ├─ 🔄 popular_products_section.dart (H-scroll + title)
│     ├─ 🎁 just_for_you_section.dart    (Grid + title)
│     ├─ ✨ new_items_section.dart       (H-scroll + title)
│     └─ 🎯 top_products_section.dart    (Circle list)
│
└─ 🚀 main.dart                ← APP ENTRY POINT
```

---

## Component Hierarchy

```
home_screen.dart (Full Page)
│
├─ AppBar/Header
│  └─ profile_header.dart
│
├─ CategoriesSection
│  ├─ Title Row
│  └─ GridView
│     ├─ CategoryCard      ← Individual category
│     ├─ CategoryCard
│     ├─ CategoryCard
│     └─ CategoryCard
│
├─ AnnouncementCard
│
├─ FlashSaleSection
│  ├─ Title + Timer
│  └─ GridView
│     ├─ FlashSaleCardWidget  ← Individual sale
│     ├─ FlashSaleCardWidget
│     └─ ...
│
├─ TopProductsSection
│  └─ HorizontalList
│     ├─ CircleAvatar
│     ├─ CircleAvatar
│     └─ ...
│
├─ PopularProductsSection
│  ├─ Title
│  └─ HorizontalList
│     ├─ PopularProductCard  ← Individual popular
│     ├─ PopularProductCard
│     └─ ...
│
├─ JustForYouSection
│  ├─ Title + Star
│  └─ GridView
│     ├─ JustForYouItemCard  ← Individual recommendation
│     ├─ JustForYouItemCard
│     └─ ...
│
└─ NewItemsSection
   ├─ Title
   └─ HorizontalList
      ├─ NewItemCard        ← Individual new item
      ├─ NewItemCard
      └─ ...
```

---

## File Dependency Chain (Example: Categories)

```
app_colors.dart
     ↑
     │ (uses)
     │
category_model.dart
     ↑
     │ (defines data)
     │
categories_service.dart
     ↑
     │ (provides data)
     │
category_card.dart
     ↑
     │ (displays single)
     │
categories_section.dart
     ↑
     │ (layouts collection)
     │
home_screen.dart
     ↑
     │ (shows on page)
     │
user sees on phone 📱
```

---

## Naming Conventions at a Glance

```
MODELS (Data)
├─ *_model.dart           ← File
├─ class *Model           ← Class name
└─ Example: category_model.dart → CategoryModel

SERVICES (Data Provider)
├─ *_service.dart         ← File
├─ class *Service         ← Class name
└─ Example: categories_service.dart → CategoriesService

SCREENS (Full Pages)
├─ *_screen.dart          ← File
├─ class *Screen          ← Class name
└─ Example: home_screen.dart → HomeScreen

CARD WIDGETS (Single Items)
├─ *_card.dart            ← File
├─ class *Card            ← Class name
└─ Example: category_card.dart → CategoryCard

SECTION WIDGETS (Collections)
├─ *_section.dart         ← File
├─ class *Section         ← Class name
└─ Example: categories_section.dart → CategoriesSection

COMMON WIDGETS
├─ *_widget.dart OR       ← File (or just descriptive)
├─ descriptive.dart
├─ class *Widget          ← Class name (or descriptive)
└─ Example: custom_textfield.dart → CustomTextfield
```

---

## Lifecycle: Adding a New Product Type

```
STEP 1: Define Data
└─ Create: models/product_name_model.dart
   Example: models/flash_sale_model.dart

STEP 2: Provide Data
└─ Create: services/product_name_service.dart
   Example: services/flash_sales_service.dart

STEP 3: Display Single Item
└─ Create: widgets/home/product_name_card.dart
   Example: widgets/home/flash_sale_card.dart

STEP 4: Display Collection
└─ Create: widgets/sections/product_name_section.dart
   Example: widgets/sections/flash_sale_section.dart

STEP 5: Use in Screen
└─ Add to: screens/home/home_screen.dart
   Code: ProductNameSection(),
```

---

## Dependency Direction (Always Downward ⬇️)

```
screens/
├─ depends on ⬇️
│
widgets/sections/
├─ depends on ⬇️
│
widgets/home/ or widgets/common/
├─ depends on ⬇️
│
models/ & services/
├─ depends on ⬇️
│
core/constants/
│
(This direction prevents circular dependencies)
```

---

## Key Ratios for Beginners

```
1 Model              →  Defines WHAT data looks like
1 Service            →  Provides data (simulates API)
1 Card Widget        →  Displays 1 item
1 Section Widget     →  Layouts multiple items
1 Screen             →  Shows everything on page

Example Chain:
1 CategoryModel → CategoriesService → CategoryCard → CategoriesSection → HomeScreen
```

---

## Feature Implementation Template

```
To add a new product section (e.g., "Coming Soon"):

1️⃣  models/coming_soon_model.dart
    └─ class ComingSoonModel { ... }

2️⃣  services/coming_soon_service.dart
    └─ static final List<ComingSoonModel> items = [...]

3️⃣  widgets/home/coming_soon_card.dart
    └─ class ComingSoonCard extends StatelessWidget { ... }

4️⃣  widgets/sections/coming_soon_section.dart
    └─ class ComingSoonSection extends StatelessWidget { ... }

5️⃣  screens/home/home_screen.dart
    └─ Add: const ComingSoonSection(),

6️⃣  Run flutter: The new section appears!

Total files: 5
Lines of code: ~200-300
Time: ~30 minutes
Difficulty: ⭐⭐ (beginner-friendly)
```

---

## Anti-Patterns (What NOT to Do)

```
❌ DO NOT:
├─ Mix business logic in widgets
├─ Hardcode colors (use AppColors)
├─ Hardcode strings (use AppStrings)
├─ Create files with 1000+ lines
├─ Use abbreviations (temp, test, util)
├─ Duplicate code across files
└─ Put everything in one folder

✅ DO INSTEAD:
├─ Keep widgets pure (UI only)
├─ Always use constants from core/
├─ Extract to separate files when needed
├─ Use clear, full names
├─ Create small, focused components
├─ Use shared patterns (cards, sections)
└─ Organize by responsibility
```

---

**This architecture combines clarity, organization, and scalability! 🚀**
