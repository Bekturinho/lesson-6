import Foundation

//Воин, Колдун, Медик, Защитник / отдельный массив
//У каждого по 1000 ХП изначально (у защитника 1500) / добавляем инфу о персе
//Каждый раунд наносят удар по 200, 300, 0, 100 / цикл с 9-ю раундами в котором минусуются очки
//Медик лечит один раз в 2 раунда всю команду на 200 ХП кроме себя самого/ условие что после второго цикла медик плюсует 200 в массивы кроме своего
//Медик наносить удар не может /


//Босс / массив с 5000 очками
//5000 ХП изначально
//Наносит по 200 ХП урона каждому игроку в течение игры пока не умрет / функция минусует 200хп у каждого массива
//Игра заканчивается когда умирает БОСС и жив хотябы один игрок, либо когда все игроки мертвы, а босс жив / условие если  у массивы героев <0 или == 0 принуем "Босс выйграл", или если у босса 0 а героев > 0 то принтуем "Игроки победили, БОСС мертв"
//В конце выводится print - сколько раундов прошло, сколько урона нанес каждый игрок и кто всё-таки стал победителем

//1 раунд
//Герои атакуют
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//Босс Атакует
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)

//Игроки победили, БОСС мертв
//9 раундов прошло
//Если ХП - 0 (т.е герой умер - делаете принт (Герой) мертв)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)


var players = [1000, 1000, 1000, 1500]
var warrior: Int? = players[0]
var magic: Int? = players[1]
var doctor: Int? = players[2]
var defender: Int? = players[3]
var boss = [5000]
var bossSpace: Int? = boss[0]
func playersAttack(){
    boss.remove(at: 0)
    bossSpace! -= 600
    boss.insert(bossSpace!, at: 0)
}
func warriorDamage(){
    players.remove(at: 0)
    warrior! -= 200
    players.insert(warrior!, at: 0)
  

}
func magicDamage(){
    players.remove(at: 1)
    magic! -= 200
    players.insert(magic!, at: 1)
   
}
func doctorDamage(){
    players.remove(at: 2)
    doctor! -= 200
    players.insert(doctor!, at: 2)

}
func defenderDamage(){
    players.remove(at: 3)
    defender! -= 200
    players.insert(defender!, at: 3)
   
}
func docHill(){
    warrior! += 200
    magic! += 200
    defender! += 200
}
func bossAttack(){
    warriorDamage()
    magicDamage()
    doctorDamage()
    defenderDamage()
}

func round(){
    playersAttack()
    bossAttack()
    print("Герои атакуют\nВоин нанес (200) урона БОССУ)\nКолдун нанес (300) урона БОССУ)\nЗащитник нанес (100) урона БОССУ)\nХП Босса - \(boss)\nБосс атакует\nХП героя - \(players[0])\nХП героя - \(players[1])\nХП героя - \(players[2])\nХП героя - \(players[3])")
}
func playersWins(){
    print("Игроки победили, БОСС мертв\n9 раундов прошло")
    if warrior! <= 0{
        print("ХП Воин умер\nХП Колдуна \(players[1])\nХП Медикa \(players[2])\nХП Защитникa \(players[3])")
    }else{
        print("ХП Воина \(players[0])\nХП Колдуна \(players[1])\nХП Медикa \(players[2])\nХП Защитникa \(players[3])")
    }
    if magic! <= 0{
        print("ХП героя \(players[0])\nКолдун Умер\nХП героя \(players[2])\nХП героя \(players[3])")
    }else{
        print("ХП героя \(players[0])\nХП героя \(players[1])\nХП героя \(players[2])\nХП героя \(players[3])")
    }
    if doctor! <= 0{
        print("ХП Воина \(players[0])\nХП Колдуна \(players[1])\nМедик Умер\nХП Защитника \(players[3])")
    }else{
        print("ХП Воина \(players[0])\nХП Колдуна \(players[1])\nМедика героя \(players[2])\nХП Защитника \(players[3])")
    }
    if defender! <= 0{
        print("nХП Воина \(players[0])\nХП Колдуна \(players[1])\nХП Медикa \(players[2])\nЗащитник Умер")
    }else{
        print("ХП Воина \(players[0])\nХП Колдуна \(players[1])\nХП Медикa \(players[2])\nХП Защитникa \(players[3])")
    }
}
func bossWins(){
    print("Игроки проиграли, БОСС победил \n9 раундов прошло\nХП Босса - \(boss)")
    
}
    
for i in 1...9{
    round()
    round()
    docHill()
    if warrior! <= 0 && doctor! <= 0 && magic! <= 0 && defender! <= 0{
        bossWins()
        break
    }
    if bossSpace! <= 0{
        playersWins()
     break
    }
    
}

