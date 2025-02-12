<p align="center">
  <img src="https://raw.githubusercontent.com/ViniciusPelatieri/Morph/refs/heads/main/Media/png/Logo_Morph.png" alt="Morph Logo" width="400">
</p>

# Morph - Query Builder for Delphi

Morph is a powerful Query Builder for Delphi that allows developers to build and manipulate SQL queries dynamically, eliminating the need to write raw SQL within the code.

## 🚀 Features

- **Eliminates inline SQL**: Keep your code clean and structured.
- **Dynamic query generation**: Create, modify, and execute queries programmatically.
- **Easy table management**: Use `Morph.Table` to define database structures.
- **Enhanced readability**: Improves maintainability by replacing SQL strings with structured methods.

## 🛠 Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/ViniciusPelatieri/Morph.git
   ```
2. Open your Delphi project and add Morph to your library path.
3. Start using Morph in your application!

## 📌 Example Usage

### 🔹 CRUD Operations

#### 🟢 CREATE

```delphi
Morph.Table('CLIENT').Field('ID').tInteger.PrimaryKey.NotNull.CreateTable;
```

#### 🔵 READ

```delphi
Morph.Select.All.From('ORDER').Where.Field('CLIENT_ID').IsBiggerOrEqualThen<Integer>(5);
         
```

#### 🟠 UPDATE

```delphi
Morph.Update.Table('CLIENT').SetField('CREDIT').NewValue<Extended>(200)
     .Where.Field('CREDIT').IsBiggerThan<Integer>(500);
```

#### 🔴 DELETE

```delphi
Morph.Delete.Table('CLIENT').Where.Field('NAME').Equals<String>('TEST');
```

## 📜 License

Morph is open-source and available under the MIT License.

## 📧 Contact

For questions, issues, or contributions, feel free to open an issue or submit a pull request on GitHub.

---

⭐ **Star the repository if you find this project useful!**

## 👥 Contributors

<a href="https://github.com/ViniciusPelatieri/Morph/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ViniciusPelatieri/Morph" />
</a>

Made with [contrib.rocks](https://contrib.rocks).




