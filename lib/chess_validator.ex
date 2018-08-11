defmodule ChessValidator do
  def run() do
    board = 
      "complex_board.txt"
      |> load_file()
      |> clean()
      |> create_board()

    moves =
      "complex_moves.txt"
      |> load_file()
      |> clean()
      |> create_moves()

    %{
      board: board,
      moves: moves
    }
  end

  def create_board(data) do
    data
    |> Enum.map(&create_row/1)    
  end

  def create_row(data) do
    data
    |> Enum.map(&create_square/1)
  end

  def create_square("--") do
    nil
  end

  def create_square(data) do
    [player_txt, piece_type_txt] = String.codepoints(data)
    player = get_player(player_txt)
    piece_type = get_piece_type(piece_type_txt)
    %{player: player, piece_type: piece_type}
  end

  def get_player(txt) do
    case txt do
      "b" -> :black
      "w" -> :white
      _ -> nil
    end
  end

  def get_piece_type(txt) do
    case txt do
      "P" -> :pawn
      "R" -> :rook
      "B" -> :bishop
      "N" -> :knight
      "Q" -> :queen
      "K" -> :king
      _ -> nil 
    end
  end


  def create_moves(data) do
    data
  end

  def load_file(file) do
    "../assets/" <> file
    |> Path.expand(__DIR__)
    |> File.read!()
  end

  def clean(data) do
    data 
    |> String.split("\n") 
    |> Enum.map(&(String.split(&1, " ")))
  end
end
