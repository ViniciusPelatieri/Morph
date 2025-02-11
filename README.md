<p align="center">
  <img src="https://raw.githubusercontent.com/ViniciusPelatieri/Morph/refs/heads/main/Media/png/Logo_Morph.png" alt="Morph Logo" width="400">
</p>

# Morph - Query Builder for Delphi

Morph is a powerful Query Builder for Delphi that allows developers to build and manipulate SQL queries dynamically, eliminating the need to write raw SQL within the code.

## 🚀 Features
- **Eliminates inline SQL**: Keep your code clean and structured.
- **Dynamic query generation**: Create, modify, and execute queries programmatically.
- **Easy table management**: Use `Morph.CreateTable` to define database structures.
- **Enhanced readability**: Improves maintainability by replacing SQL strings with structured methods.

## 🛠 Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/ViniciusPelatieri/Morph.git
   ```
2. Open your Delphi project and add Morph to your library path.
3. Start using Morph in your application!

## 📌 Example Usage
```delphi
uses Morph;

var
  Morph: TMorph;
begin
  Morph.Table('CLIENT')
          .Field('ID').Integer.PrimaryKey.NotNull
          .Field('NAME').Varchar(100).NotNull
          .Field('EMAIL').Varchar(100).NotNull.Unique
          .Field('PHONE').Varchar(15).NotNull.Unique
        .Create;
end;
```

## 📜 License
Morph is open-source and available under the MIT License.

## 📧 Contact
For questions, issues, or contributions, feel free to open an issue or submit a pull request on GitHub.

---

⭐ **Star the repository if you find this project useful!**

