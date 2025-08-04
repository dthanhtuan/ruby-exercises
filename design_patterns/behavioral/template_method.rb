# Template Method is a behavioral design pattern that defines the skeleton of an algorithm in the superclass
# but lets subclasses override specific steps of the algorithm without changing its structure.

class FileProcessor
  def process_file
    open_file
    data = read_data
    processed = process_data(data)
    close_file
    processed
  end

  def open_file
    puts "Opening file..."
  end

  def close_file
    puts "Closing file..."
  end

  # Phương thức trừu tượng, override ở subclass
  def read_data
    raise NotImplementedError, "You must implement read_data"
  end

  def process_data(data)
    raise NotImplementedError, "You must implement process_data"
  end
end

class CSVProcessor < FileProcessor
  def read_data
    puts "Reading data from CSV"
    # Đọc CSV giả lập
    ["row1", "row2", "row3"]
  end

  def process_data(data)
    puts "Processing CSV data"
    data.map(&:upcase)
  end
end

class PDFProcessor < FileProcessor
  def read_data
    puts "Reading data from PDF"
    # Đọc PDF giả lập
    "PDF content"
  end

  def process_data(data)
    puts "Processing PDF data"
    data.length
  end
end

class ExcelProcessor < FileProcessor
  def read_data
    puts "Reading data from Excel"
    # Đọc Excel giả lập
    [1, 2, 3, 4]
  end

  def process_data(data)
    puts "Processing Excel data"
    data.sum
  end
end

csv = CSVProcessor.new
p csv.process_file
# Output:
# Opening file...
# Reading data from CSV
# Processing CSV data
# Closing file...
# ["ROW1", "ROW2", "ROW3"]

pdf = PDFProcessor.new
p pdf.process_file
# Output:
# Opening file...
# Reading data from PDF
# Processing PDF data
# Closing file...
# 11

excel = ExcelProcessor.new
p excel.process_file
# Output:
# Opening file...
# Reading data from Excel
# Processing Excel data
# Closing file...
# 10
