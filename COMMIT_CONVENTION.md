# 🚀 Commit Conventions

To keep a **clean and organized** commit history, we follow the **Semantic Commit Messages** convention. Each commit should follow this structure:

```
<type>(<scope>): <message>
```

## ✨ Commit Types

| Type      | Description |
|-----------|-------------|
| **feat** ✨ | Introducing a new feature |
| **fix** 🐛 | Fixing a bug |
| **refactor** 🔨 | Code improvement without changing functionality |
| **perf** ⚡ | Performance optimization |
| **style** 🎨 | Code style changes (formatting, indentation, etc.) |
| **chore** 🔧 | Project maintenance (dependencies, CI/CD, etc.) |

---

## 📌 Scopes

Your commit scope should indicate **which part of the project** is affected.

### **Morph Scopes** (Query Builder)
- **table** 🏛️ → Related to table structure
- **field** 🔠 → Related to fields
- **select** 📊 → Query selection logic
- **vector** 🧠 → Vector processing
- **enhance** 🚀 → General improvements
- **insert** ➕ → Insertion logic
- **update** 🔄 → Update logic
- **delete** ❌ → Deletion logic
- **where** 🔍 → Query conditions

### **Sample Scopes** (Example Application)
- **pdv** 🛒 → Point of sale
- **clients** 👥 → Customer management
- **sellers** 🤝 → Seller-related features
- **orders** 📦 → Order processing
- **products** 🏷️ → Product management
- **reports** 📈 → Reporting module

---

## 🔥 Examples

```
feat(select): Added support for complex joins
fix(field): Fixed nullable field issue in Firebird
refactor(table): Improved table creation logic
perf(select): Improved select speed with cache
style(where): Reformatted query indentation
chore(pdv): Updated dependencies for PDV module
```

💡 **Tip:** Keep commit messages **short** and **descriptive**.

---

By following these conventions, we ensure a **consistent**, **organized**, and **easy-to-read** commit history. 🚀

