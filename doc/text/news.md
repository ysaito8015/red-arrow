# News

## 0.4.1 - 2017-09-19

### Improvements

  * `Arrow::Array.new`: Improved performance.

### Fixes

  * `Arrow::Buffer`: Fixed a crash on GC.

## 0.4.0 - 2017-05-18

### Improvements

  * `Arrow::StringArray#[]`: Changed to return `String` instead of
    `GLib::Bytes`.

## 0.3.1 - 2017-05-17

### Improvements

  * `Arrow::MemoryMappedInputStream`: Renamed from
    `Arrow::MemoryMappedFile`.

  * `Arrow::RecordBatchStreamReader`: Renamed from
    `Arrow::StreamReader`.

  * `Arrow::RecordBatchFileReader`: Renamed from
    `Arrow::FileReader`.

  * `Arrow::RecordBatchStreamWriter`: Renamed from
    `Arrow::StreamWriter`.

  * `Arrow::RecordBatchFileWriter`: Renamed from
    `Arrow::FileWriter`.

  * `Arrow::Column#each`: Added.

  * `Arrow::ChunkedColumn#each`: Added.

  * `Arrow::Table#columns`: Added.

  * `Arrow::Table#each_column`: Added.

  * Supported auto native package install on install.

## 0.3.0 - 2017-05-06

### Improvements

  * `Arrow::Record#to_h`: Added.

  * `#to_arrow`: Added convenience methods for polymorphism.

  * Supported Apache Arrow 0.3.0.

## 0.2.2 - 2017-04-24

### Improvements

  * `Arrow::RecordBatch#each`: Supported reusing record object for
    performance.

  * ``Arrow::IO`: Unified into `Arrow`.

  * ``Arrow::IPC`: Unified into `Arrow`.

## 0.2.1 - 2017-03-23

### Improvements

  * Added `Arrow::IPC::FileReader#each`.

### Fixes

  * Fixed a bug that `Arrow::Record#[]` doesn't work.

## 0.2.0 - 2017-03-14

Initial release!!!
