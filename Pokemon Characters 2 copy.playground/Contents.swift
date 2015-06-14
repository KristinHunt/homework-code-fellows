//: Playground - noun: a place where people can play

import UIKit

class Pokemon {
  var level = 1
  var health = 100
  var type = "Fire"
  
  init (startingLevel : Int, startingHealth : Int) {
    level = startingLevel
    health = startingHealth
  
  func levelUp() {
    level++
  }
  }
}

class Caterpie : Pokemon {
  func rockSmash() -> Int {
    let damage = 40
    return damage
  }
}

let lilCaterpie = Caterpie(startingLevel: 1, startingHealth: 50)
let rockSmashDamage = lilCaterpie.rockSmash()
let newHealthLC = lilCaterpie.health - rockSmashDamage


class Weedle : Pokemon {
  func psychic() -> Int {
    let damage = 20
    return damage
  }
}

let babyWeedle = Weedle(startingLevel: 2, startingHealth: 75)
let psychicDamage = babyWeedle.psychic()
let newHealthBW = babyWeedle.health - psychicDamage


class Beedrill : Pokemon {
  func rage() -> Int {
    let damage = 35
    return damage
  }
}

let babyBeedrill = Beedrill(startingLevel: 3, startingHealth: 90)
let rageDamage = babyBeedrill.rage()
let newHealthBB = babyBeedrill.health - rageDamage


class Jigglypuff : Pokemon {
  func doubleSlap() -> Int {
    let damage = 35
    return damage
  }
}

let littleJigg = Jigglypuff(startingLevel: 6, startingHealth: 100)
let doubleSlapDamage = littleJigg.doubleSlap()
let newHealthLJ = littleJigg.health - doubleSlapDamage

class Haunter : Pokemon {
  func hex() -> Int {
    let damage = 55
    return damage
  }
}

let miniHaunter = Haunter(startingLevel: 10, startingHealth: 85)
let hexDamage = miniHaunter.hex()
let newHealthMH = miniHaunter.health - hexDamage

class Drowzee : Pokemon {
  func hypnosis() -> Int {
    let damage = 40
    return damage
  }
}

let babyDrowzee = Drowzee(startingLevel: 2, startingHealth: 100)
let hypnosisDamage = babyDrowzee.hypnosis()
let newHealthBD = babyDrowzee.health - hypnosisDamage


class Smeargle : Pokemon {
  func electricity() -> Int {
    let damage = 60
    return damage
  }
}

let littleSmeargle = Smeargle(startingLevel: 6, startingHealth: 70)
let electricityDamage = littleSmeargle.electricity()
let newHealthLS =  littleSmeargle.health - electricityDamage

class Gothita : Pokemon {
  func castspell() -> Int {
    let damage = 10
    return damage
  }
}

let miniGoth = Gothita(startingLevel: 1, startingHealth: 50)
let spellDamage = miniGoth.castspell()
let newHealthMG = miniGoth.health - spellDamage

class Garchomp : Pokemon {
  func sandstorm() -> Int {
    let damage = 80
    return damage
  }
}

let garchompJr = Garchomp(startingLevel: 3, startingHealth: 100)
let sandstormDamage = garchompJr.sandstorm()
let newHealthGJ = garchompJr.health - sandstormDamage

class Cubchoo : Pokemon {
  func blackSnow() -> Int {
    let damage = 100
    return damage
  }
}

let tinyCub = Cubchoo(startingLevel: 1, startingHealth: 85)
let blackSnowDamage = tinyCub.blackSnow()
let newHealthTC = tinyCub.health - blackSnowDamage

//tinyCub is dead


