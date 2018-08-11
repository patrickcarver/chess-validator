defmodule ChessValidator do
  def run() do
    board = 
      "complex_board.txt"
      |> load_file()
      |> clean()

    moves =
      "complex_moves.txt"
      |> load_file()
      |> clean()

    %{
      board: board,
      moves: moves
    }
  end

  def load_file(file) do
    "../assets/" <> file
    |> Path.expand(__DIR__)
    |> File.read!()
  end

  def clean(data) do
    data |> String.split("\n")
  end
end
