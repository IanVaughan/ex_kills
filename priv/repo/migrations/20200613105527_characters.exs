defmodule Kills.Repo.Migrations.Characters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :alliance_id, :integer # 99006343,
      add :ancestry_id, :integer # 8,
      add :birthday, :string # "2019-04-13T10:34:41Z",
      add :bloodline_id, :integer # 2,
      add :corporation_id, :integer # 98606096,
      add :description, :text # "<font size=\"12\" color=\"#bfffffff\"><b><u>Rules to live by in Eve:</b></u><br>1. If it moves, </font><font size=\"12\" color=\"#ff7f0000\">shoot it</font><font size=\"12\" color=\"#bfffffff\">.<br>2. If it doesn't move, poke it with your turret &amp; then </font><font size=\"12\" color=\"#ffff0000\">shoot it</font><font size=\"12\" color=\"#bfffffff\">.<br>3. When in doubt - </font><font size=\"12\" color=\"#ff7f0000\">Shoot It</font><font size=\"12\" color=\"#bfffffff\">!!<br>4. </font><font size=\"12\" color=\"#ffffff00\">NOT ENOUGH DAKKA</font><font size=\"12\" color=\"#bfffffff\">!<br>5. Overkill works.<br>6. Just because it breathes, doesn't mean it should.<br>7. If all is going well, it's an ambush.<br>8. If it's not moving </font><font size=\"12\" color=\"#ff7f0000\">shoot it anyway</font><font size=\"12\" color=\"#bfffffff\">, it might move later.<br>9. Always bring enough gun. More than enough gun is also acceptable.<br>10. </font><font size=\"12\" color=\"#ffffff00\">STILL NOT ENOUGH DAKK</font><font size=\"12\" color=\"#bfffffff\">A!<br><br>P.S. If it starts moving after you </font><font size=\"12\" color=\"#ff7f0000\">shoot it</font><font size=\"12\" color=\"#bfffffff\">, </font><font size=\"12\" color=\"#ff007fff\">scram it</font><font size=\"12\" color=\"#bfffffff\">, </font><font size=\"12\" color=\"#ff7f0000\">shoot it again</font><font size=\"12\" color=\"#bfffffff\"> and </font><font size=\"12\" color=\"#ff007f00\">call for back-up</font><font size=\"12\" color=\"#bfffffff\">!</font>",
      add :gender, :string # "male",
      add :name, :string # "StyxSarcastrophe Rin",
      add :race_id, :integer # 1,
      add :security_status, :float # 5.000905512112954

      timestamps()
    end
  end
end
