class_name PartyMember extends Node

var maxHP: int;
var speed: int;
var maxMP: int;
var mpName: String;
var className: String;
var charName: String;
var physicalAttacks: Dictionary;
var abilities: Dictionary;

var exp = 0;
var level = 1;
var expToNextLevel = 100;
var currentHP: int;
var currentMP: int;

## CONSTRUCT PARTY MEMBER, RETURNS CONSTRUCTED PARTY MEMBER
static func create(mHP: int, spd: int, mana: int, mName: String, nombre: String, pAtks: Dictionary, ablts: Dictionary) -> PartyMember:
	var instance = PartyMember.new()
	
	instance.maxHP = mHP;
	instance.speed = spd;
	instance.maxMP = mana;
	instance.physicalAttacks = pAtks;
	instance.abilities = ablts;
	instance.mpName = mName;
	instance.charName = nombre;
	
	instance.currentHP = mHP;
	instance.currentMP = mana;
	
	return instance
