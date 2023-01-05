extends Node

signal infomenu_toggled(value)

onready var scene_tree: = get_tree()

var menu: = "" setget set_infomenu
var infomenu_state: = false setget set_infomenu_state
var pauzed: = false setget set_pauzed
var playbutton_dict: = {}

export var hackfix_dict: = {
        "acetyl_CoA": """Acetyl coenzyme A
Acetyl coenzyme A (acetyl CoA) is the entry compound for the citric acid cycle in cellular respiration, formed from a two-carbon fragment of pyruvate attached to a coenzyme.
""",
        "adp.txt": """Adenosine diphosphate 
Adenosine diphosphate (ADP) is a nucleoside diphosphate that is formed together with inorganic phosphate (Pi) in the reaction of ATP and water. 
""",
        "aerobic_dissimilation.txt": """Aerobic Dissimilation
Aerobic dissimilation is a catabolic pathway for organic molecules. A catabolic pathway releases energy by breaking down complex molecules to simpler molecules. Aerobic dissimilation uses oxygen as the final electron acceptor in an electron transport chain and ultimately produces ATP. It is the most efficient catabolic pathway and is carried out in most eukaryotic cells and many prokaryotic organisms.
""",
        "atp.txt": """ATP
Adenosine triphosphate (ATP) contains the sugar ribose, with the nitrogenous base adenine and a chain of three phosphate groups (the triphosphate group) bonded to it. It is a molecule that releases free energy when its phosphate bonds are hydrolyzed and ADP is formed. This energy is used to drive reactions that cannot happen spontaneously in cells. 
""",
        "citric_acid_cycle.txt": """Citric acid cycle
The citric acid cycle is a chemical cycle involving eight steps that completes the metabolic breakdown of glucose molecules by oxidizing acetyl CoA (derived from pyruvate) to carbon dioxide. It occurs within the mitochondrion in eukaryotic cells and in in the cytosol of prokaryotes. It is the second major stage in cellular respiration, together with pyruvate oxidation.
""",
        "glycolysis.txt": """Glycolysis
A series of reactions that ultimately splits glucose into two molecules of pyruvate. The word glycolysis means 'sugar splitting', and that is exactly what happens during this pathway. Glucose, a six-carbon sugar, is split into two two three-carbon sugars. These smaller sugars are then oxidized and their remaining atoms rearranged to form two molecules of pyruvate. Glycolysis can be divided into two phases: the energy investment phase and the energy payoff phase. During the energy investment phase, the cell actually spends 2 ATP. During the energy payoff phase, the cell gains 4 ATP. 
Glycolysis occurs in almost all living cells, serving as the starting point for fermentation or cellular respiration. 
""",
        "glycolysis_instructions.txt": """The First Game
In this first game, you are the glucose molecule, ready to be converted into ATP.
In the first stage, you're going to need to pick up some ATP to start the process, in the second stage, you can pick up the ADP and convert them into ATP as a payoff.

Good luck!
""",
        "mitochondrium.txt": """Mitochondrion
An organelle in eukaryotic cells that serves as the site of the citric acid cycle and oxidative phosphorylation. It uses oxygen to break down organic molecules and synthesize ATP. 
""",
        "nad_plus.txt": """NAD+
NAD+ is the oxidized form of nicotinamide adenine dinucleotide, a coenzyme that can accept electrons, becoming NADH. As an electron acceptor, NAD+ functions as an oxidizing agent during respiration. So it traps electrons from glucose. 
NAD+ is the most versatile electron acceptor in cellular respiration and functions in several of the redox steps during breakdown of glucose. Electrons lose very little of their potential energy when they are transferred from glucose to NAD+.
""",
        "nadh.txt": """NADH
The reduced form of nicotinamide adenine dinucleotide that temporarily stores electrons during cellular respiration. NADH acts as an electron donor to the electron transport chain during oxidative phosphorylation. Electrons removed from glucose are shuttled by NADH to the higher-energy end of the chain. At the lower-energy end, O2 caputres these electrons along with hydrogen forming water.
""",
        "oxidative_phosphorylation.txt": """Oxidative phosphorylation
Oxidative phosphorylation is the production of ATP using energy derived from the redox reactions of an electron transport chain. It is the third major stage of cellular respiration. 
During oxidative phosphorylation, the electron transport chain accepts electrons from NADH generated during glycolysis and the citric acid cycle. These electrons are passed down the chain. At the end of the chain, the electrons are combined with oxygen (O2) and hydrogen ions (H+), forming water. The energy released at each step of the chain is stored in a form the mitochondrion can use to make ATP from ADP.
""",
        "pyruvate.txt": """Pyruvate 
Pyruvate is a three-carbon molecule and the ionized form of pyruvic acid. It is formed in the last step of glycolysis. Upon entering the mitochondrion via active transport, pyruvate is converted to a compound called acetyl coenzyme A or acetyl CoA.
""",
}


func _ready() -> void:
    reset()

func reset() -> void:
    menu = "res://assets/texts/Test.txt"
    playbutton_dict = create_playbutton_dict("res://assets/texts/")


func set_infomenu(value: String) -> void:
    menu = value
    set_infomenu_state(true)

func set_infomenu_state(value: bool) -> void:
    infomenu_state = value
    set_pauzed(value)
    emit_signal("infomenu_toggled", value)

func set_pauzed(value: bool) -> void:
    pauzed = value
    scene_tree.paused = pauzed

func create_playbutton_dict(dir: String):
    var files = list_files_in_directory(dir)
    var dict: = {}
    for file in files:
        var file_name = file
        dict[file_name] = false
    return dict

func list_files_in_directory(path):
    var files = []
    var dir = Directory.new()
    dir.open(path)
    dir.list_dir_begin()

    while true:
        var file = dir.get_next()
        if file == "":
            break
        elif not file.begins_with("."):
            files.append(file)

    dir.list_dir_end()

    return files
