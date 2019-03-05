class Car
  # 定数を追加
  UP_SPEED = 10
  DOWN_SPEED = 20
  MAX_PASSENGERS = 4

  @@count = 0
  attr_accessor :number, :color, :passengers
  # speedは外部から設定しないのでreaderで定義
  # @speedが使えるようになる
  attr_reader :speed

  def initialize(number, color)
    @number = number
    @color = color
    # @speedを初期化
    @passengers = 0
    @speed = 0
    @@count += 1
  end

  # 加速用のメソッド追加
  def speed_up
    @speed += UP_SPEED
    if @speed == 30
      puts "[ALERT]スピードが30になりました。"
    elsif @speed == 40
      puts "[ALERT]スピードが40になりました。"
    elsif @speed == 50
      @speed -= DOWN_SPEED
      puts "[ALERT]スピードが50になりました。減速します。"
    end
  end

  # 減速用のメソッド追加
  def speed_down
    # ifの結果を変数に代入する場合は以下の記述でOK
    @speed = if @speed - DOWN_SPEED < 0
               0
             else
               @speed - DOWN_SPEED
             end
  end

  def passengers
    if @passengers == MAX_PASSENGERS
      @passengers = 4
    else
      @passengers += 1
    end
  end

  def get_on
    if @passengers == MAX_PASSENGERS
      puts "乗車出来ません。この車の最大乗車人数は4人です。"
    else
      puts "乗車しました。"
    end
  end

  def self.count
    @@count  # return @@countの略
  end
  def self.count_info
    puts "Carクラスのクラス変数@@countは#{@@count}です。"
  end
end

class TrackCar < Car
  attr_reader :load_weight

  def initialize(number, color, load_weight=500)
    @number = number
    @color = color
    @load_weight = load_weight
  end
end