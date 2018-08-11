defmodule ChessValidator do
  def run() do
    board_file = "complex_board.txt"
    board_data = load_file(board_file)

    moves_file = "complex_moves.txt"
    moves_data = load_file(moves_file)

    %{
      board: board_data,
      moves: moves_data
    }
  end

  def load_file(file) do
    "../assets/" <> file
    |> Path.expand(__DIR__)
    |> File.read!() 
  end
end
