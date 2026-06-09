# metaphysics_core

Core enums and domain models for Xuan Metaphysics projects (Pure Dart).

This package acts as the absolute foundation layer for the Xuan Metaphysics ecosystem. It defines basic metaphysical concepts, enums, and utility helper models.

## 📦 Core Contents

- **Enums**: 
  - `Enum8Gua` (八卦)
  - `TianGan` (天干)
  - `DiZhi` (地支)
  - `YinYang` (阴阳)
  - `FiveXing` (五行)
  - `JiaZi` (六十甲子)
  - `LiuQin` (六亲)
  - `TenGods` (十神)
- **Domain Models & Calculators**:
  - `EightChars` (八字排盘核心数据模型)
  - `DaYun` (大运计算)
  - `TaiYuan` (胎元计算)

---

## 🛠️ Code Intelligence & Developer Tooling

This repository is optimized for AI-native and tool-augmented developer workflows. The following directories are ignored by Git as they contain local binaries and caches, but they can be easily re-generated:

### 1. CodeGraph (`.codegraph/`)
Contains `codegraph.db`, a local SQLite database that indexes files and symbols to provide fast code search and semantic understanding for AI coders.
* **How to initialize locally**:
  ```bash
  codegraph init
  # or
  npx codegraph index
  ```

### 2. Understand Anything & GitNexus (`.understand-anything/`)
Contains dependency graphs, file fingerprints, and structural maps (`knowledge-graph.json`) to perform safety checks and impact analysis.
* **How to initialize locally**:
  If GitNexus reports that the index is stale or missing, run:
  ```bash
  npx gitnexus analyze
  ```

---

## 🧪 Testing

Run the test suite to ensure the domain models and calculators operate correctly:

```bash
dart test
```
