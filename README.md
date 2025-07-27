# Flutter Blueprint CLI

A modern CLI tool for generating Flutter projects with a non-feature-based clean architecture, powered by template-driven code generation using Mason bricks.

---

## 🚀 Installation

```sh
dart pub global activate flutter_blueprint_cli
```

---

## 🛠️ Usage

Run from anywhere:

```sh
flutterclean <command> [arguments]
```

---

## 📦 Commands

- `create <project_name> [--no-dep]`
  - Create a new clean architecture Flutter project. Also generates a default `user` feature.
- `add <name>`
  - Add a model, data source and repository file to the data layer using the provided `<name>`.
- `add --model <name>`
  - Add a model file to the data layer using the provided `<name>`.
- `add --data <name>`
  - Add a data source and repository to the data layer using the provided `<name>`.
- `help`
  - Show usage instructions for all commands.

---

## ✨ Features

- Non-feature-based clean architecture structure
- Automatic Dart version syncing with your Flutter SDK
- Always generates a sample `user` feature on project creation
- Works globally from any directory

---

## 🤝 Contributing

- PRs are welcome! Please ensure your code is well documented.
- For brick/template changes, see the `bricks/` directory.

---

**Note:**
- All code generation is handled by Mason bricks. To customize the generated code, edit the bricks in the `bricks/` directory.
- For any issues or feature requests, please open an issue on the repository.
