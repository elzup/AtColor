class Idol < ApplicationRecord
  def self.setup
    Idol.delete_all
    data = [['相川千夏', 23], ['愛野渚', 18], ['相原雪乃', 22], ['相葉夕美', 18], ['赤城みりあ', 11], ['赤西瑛梨華', 16], ['秋月律子', 19], ['浅野風香', 16], ['浅利七海', 14], ['ｱﾅｽﾀｼｱ', 15], ['安部菜々', 17], ['天海春香', 17], ['綾瀬穂乃香', 17], ['荒木比奈', 20], ['有浦柑奈', 19], ['安斎都', 16], ['五十嵐響子', 15], ['池袋晶葉', 14], ['伊集院惠', 21], ['一ノ瀬志希', 18], ['市原仁奈', 9], ['ｲｳﾞ･ｻﾝﾀｸﾛｰｽ', 19], ['今井加奈', 16], ['井村雪菜', 17], ['上田鈴帆', 14], ['氏家むつみ', 13], ['梅木音葉', 19], ['江上椿', 19], ['衛藤美紗希', 22], ['海老原菜帆', 17], ['及川雫', 16], ['大石泉', 15], ['太田優', 21], ['大槻唯', 17], ['大西由里子', 20], ['大沼くるみ', 13], ['大原みちる', 15], ['岡崎泰葉', 16], ['緒方智絵里', 16], ['奥山沙織', 19], ['乙倉悠貴', 13], ['片桐早苗', 28], ['上条春菜', 18], ['神谷奈緒', 17], ['川島瑞樹', 28], ['神崎蘭子', 14], ['我那覇響', 16], ['菊地真', 17], ['如月千早', 16], ['岸部彩華', 19], ['北川真尋', 17], ['喜多日菜子', 15], ['喜多見柚', 15], ['木場真奈美', 25], ['木村夏樹', 18], ['ｷｬｼｰ･ｸﾞﾗﾊﾑ', 15], ['桐野ｱﾔ', 19], ['桐生つかさ', 18], ['日下部若葉', 20], ['工藤忍', 16], ['ｸﾗﾘｽ', 20], ['栗原ﾈﾈ', 15], ['黒川千秋', 20], ['ｹｲﾄ', 20], ['古賀小春', 12], ['輿水幸子', 14], ['小関麗奈', 13], ['小早川紗枝', 15], ['小日向美穂', 17], ['小松伊吹', 19], ['小室千奈美', 19], ['西園寺琴歌', 17], ['斉藤洋子', 20], ['冴島清美', 15], ['榊原里美', 17], ['鷺沢文香', 19], ['佐久間まゆ', 16], ['櫻井桃華', 12], ['佐々木千枝', 11], ['佐城雪美', 10], ['佐藤心', 26], ['沢田麻理菜', 26], ['財前時子', 21], ['椎名法子', 13], ['塩見周子', 18], ['四条貴音', 18], ['篠原礼', 27], ['渋谷凛', 15], ['島村卯月', 17], ['首藤葵', 13], ['白菊ほたる', 13], ['白坂小梅', 13], ['城ヶ崎美嘉', 17], ['城ヶ崎莉嘉', 12], ['杉坂海', 18], ['涼宮星花', 19], ['関裕美', 14], ['瀬名詩織', 19], ['仙崎恵磨', 21], ['相馬夏美', 25], ['高垣楓', 25], ['高槻やよい', 14], ['高橋礼子', 31], ['鷹富士茄子', 20], ['高峯のあ', 24], ['高森藍子', 16], ['多田李衣菜', 17], ['橘ありす', 12], ['月宮雅', 18], ['土屋亜子', 15], ['東郷あい', 23], ['十時愛梨', 18], ['ﾄﾚｰﾅｰ', 23], ['道明寺歌鈴', 17], ['中野有香', 18], ['長富蓮実', 16], ['ﾅﾀｰﾘｱ', 14], ['並木芽衣子', 22], ['成宮由愛', 13], ['南条光', 14], ['難波笑美', 17], ['西川保奈美', 16], ['西島櫂', 19], ['新田美波', 19], ['二宮飛鳥', 14], ['丹羽仁美', 18], ['野々村そら', 15], ['萩原雪歩', 17], ['服部瞳子', 25], ['浜川愛結奈', 22], ['浜口あやめ', 15], ['早坂美玲', 14], ['速水奏', 17], ['原田美世', 20], ['柊志乃', 31], ['日野茜', 17], ['姫川友紀', 20], ['兵藤ﾚﾅ', 27], ['福山舞', 10], ['藤居朋', 19], ['藤本里奈', 18], ['藤原肇', 16], ['双葉杏', 17], ['双海亜美', 13], ['双海真美', 13], ['古澤頼子', 17], ['ﾍﾚﾝ', 24], ['ﾍﾞﾃﾗﾝﾄﾚｰﾅｰ', 26], ['北条加蓮', 16], ['星井美希', 15], ['星輝子', 15], ['堀裕子', 16], ['本田未央', 15], ['前川みく', 15], ['槙原志保', 19], ['ﾏｽﾀｰﾄﾚｰﾅｰ', 28], ['松尾千鶴', 15], ['松永涼', 18], ['松原早耶', 18], ['松本沙理奈', 22], ['松山久美子', 21], ['的場梨沙', 12], ['間中美里', 20], ['真鍋いつき', 22], ['三浦あずさ', 21], ['水木聖來', 23], ['水野翠', 18], ['水本ゆかり', 15], ['水瀬伊織', 15], ['三船美優', 26], ['三村かな子', 17], ['宮本ﾌﾚﾃﾞﾘｶ', 19], ['三好紗南', 14], ['向井拓海', 18], ['棟方愛海', 14], ['村上巴', 13], ['村松さくら', 15], ['ﾒｱﾘｰ･ｺｸﾗﾝ', 11], ['持田亜里沙', 21], ['望月聖', 13], ['桃井あずき', 15], ['森久保乃々', 14], ['諸星きらり', 17], ['楊菲菲', 15], ['八神ﾏｷﾉ', 18], ['矢口美羽', 14], ['柳清良', 23], ['柳瀬美由紀', 14], ['大和亜季', 21], ['結城晴', 12], ['遊佐こずえ', 11], ['横山千佳', 9], ['吉岡沙紀', 17], ['依田芳乃', 16], ['ﾗｲﾗ', 16], ['龍崎薫', 9], ['ﾙｰｷｰﾄﾚｰﾅｰ', 19], ['若林智香', 17], ['脇山珠美', 16], ['和久井留美', 26]]
    data.each do |d|
      Idol.create(name: d[0], age: d[1])
    end
  end
end
