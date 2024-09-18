defmodule FileProcessor do
  # A lines_lengths!/1 that takes a file path and returns a list of numbers, with each
  #number representing the length of the corresponding line from the file

  #stream implement lazy and composable iterations
  def lines_lengths! do
    file_path = ~S(C:\Users\mechelle.niezas\elixer test\numbers\docs\testfile.txt)
    file_path
    |> File.stream!()             # Stream the file line by line
    |> Stream.map(&String.length/1)  # Get the length of each line
    |> Enum.to_list()             # Collect the results into a list
  end

  #A longest_line_length!/1 that returns the length of the longest line in a file.
  def longest_line_length! do
    file_path = ~S(C:\Users\mechelle.niezas\elixer test\numbers\docs\testfile.txt)
    file_path
    |> File.stream!()               # Stream the file line by line
    |> Stream.map(&String.length/1) # Get the length of each line
    |> Enum.max()                   #display the length of the longest line.
  end

  #A longest_line!/1 that returns the contents of the longest line in a file.
  def longest_line! do
    file_path = ~S(C:\Users\mechelle.niezas\elixer test\numbers\docs\testfile.txt)
    longest_line = file_path
    |> File.stream!()               # Stream the file line by line
    |> Enum.reduce("", fn line, longest -> #not sure if there is easier than this lol. how cool we can pass the whole codes to a variable
      if String.length(line) > String.length(longest) do
        line
      else
        longest
      end
    end)

    IO.puts("#{longest_line}") #String Interpolation this will display as is when there is "" in the file and not "\
  end

  #A words_per_line!/1 that returns a list of numbers, with each number representing the word count in a file.
  #Hint: To find the word count of a line, use  #length(String.split(line))
  def words_per_line! do
    file_path = ~S(C:\Users\mechelle.niezas\elixer test\numbers\docs\testfile.txt)
    file_path
    |> File.stream!()                    # Stream the file line by line
    |> Stream.map(&String.split/1)        # Split each line into words
    |> Stream.map(&length/1)              # Count the number of words in each line
    |> Enum.to_list()                     # Collect the results into a list
  end

  #combine all the stream.map
  def words_per_line_v2! do
    file_path = ~S(C:\Users\mechelle.niezas\elixer test\numbers\docs\testfile.txt)
    file_path
    |> File.stream!()                    # Stream the file line by line
    |> Stream.map(&length(String.split(&1)))             # Split each line into words then Count the number of words in each line
    |> Enum.to_list()                     # Collect the results into a list
  end
end
