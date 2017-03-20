# -*- encoding: utf-8 -*-

require 'rumoji/emoji'
require 'set'

module Rumoji
  class Emoji
    PEOPLE = SortedSet[
      self.new("\u{1F604}", [:smile, :simple_smile], "SMILING FACE WITH OPEN MOUTH AND SMILING EYES"),
      self.new("\u{1F606}", [:laughing], "SMILING FACE WITH OPEN MOUTH AND TIGHTLY-CLOSED EYES"),
      self.new("\u{1F60A}", [:blush], "SMILING FACE WITH SMILING EYES"),
      self.new("\u{1F603}", [:smiley], "SMILING FACE WITH OPEN MOUTH"),
      self.new("\u{263A}" , [:relaxed], "WHITE SMILING FACE"),
      self.new("\u{1F60F}", [:smirk], "SMIRKING FACE"),
      self.new("\u{1F60D}", [:heart_eyes], "SMILING FACE WITH HEART-SHAPED EYES"),
      self.new("\u{1F618}", [:kissing_heart], "FACE THROWING KISS"),
      self.new("\u{1F61A}", [:kissing_closed_eyes], "KISSING FACE WITH CLOSED EYES"),
      self.new("\u{1F633}", [:flushed], "FLUSHED FACE"),
      self.new("\u{1F625}", [:relieved, :disappointed_relieved], "DISAPPOINTED BUT RELIEVED FACE"),
      self.new("\u{1F60C}", [:satisfied], "RELIEVED FACE"),
      self.new("\u{1F601}", [:grin], "GRINNING FACE WITH SMILING EYES"),
      self.new("\u{1F609}", [:wink], "WINKING FACE"),
      self.new("\u{1F61C}", [:stuck_out_tongue_winking_eye, :wink2], "FACE WITH STUCK OUT TONGUE AND WINKING EYE"), # "kidding, not serious"
      self.new("\u{1F61D}", [:stuck_out_tongue_closed_eyes], "FACE WITH STUCK-OUT TONGUE AND TIGHTLY-CLOSED EYES"), # "kidding, not serious"
      self.new("\u{1F600}", [:grinning], "GRINNING FACE"),
      self.new("\u{1F617}", [:kissing], "KISSING FACE"),
      self.new("\u{1F619}", [:kissing_smiling_eyes], "KISSING FACE WITH SMILING EYES"),
      self.new("\u{1F61B}", [:stuck_out_tongue], "FACE WITH STUCK-OUT TONGUE"),
      self.new("\u{1F634}", [:sleeping], "SLEEPING FACE"),
      self.new("\u{1F61F}", [:worried], "WORRIED FACE"),
      self.new("\u{1F626}", [:frowning], "FROWNING FACE WITH OPEN MOUTH"),
      self.new("\u{1F627}", [:anguished], "ANGUISHED FACE"),
      self.new("\u{1F62E}", [:open_mouth], "FACE WITH OPEN MOUTH"),
      self.new("\u{1F62C}", [:grimacing], "GRIMACING FACE"),
      self.new("\u{1F615}", [:confused], "CONFUSED FACE"),
      self.new("\u{1F62F}", [:hushed], "HUSHED FACE"),
      self.new("\u{1F611}", [:expressionless], "EXPRESSIONLESS FACE"),
      self.new("\u{1F612}", [:unamused], "UNAMUSED FACE"),
      self.new("\u{1F605}", [:sweat_smile], "SMILING FACE WITH OPEN MOUTH AND COLD SWEAT"),
      self.new("\u{1F613}", [:sweat], "FACE WITH COLD SWEAT"),
      self.new("\u{1F629}", [:weary], "WEARY FACE"),
      self.new("\u{1F614}", [:pensive], "PENSIVE FACE"),
      self.new("\u{1F61E}", [:disappointed], "DISAPPOINTED FACE"),
      self.new("\u{1F616}", [:confounded], "CONFOUNDED FACE"),
      self.new("\u{1F628}", [:fearful], "FEARFUL FACE"),
      self.new("\u{1F630}", [:cold_sweat], "FACE WITH OPEN MOUTH AND COLD SWEAT"),
      self.new("\u{1F623}", [:persevere], "PERSEVERING FACE"),
      self.new("\u{1F622}", [:cry], "CRYING FACE"),
      self.new("\u{1F62D}", [:sob], "LOUDLY CRYING FACE"),
      self.new("\u{1F602}", [:joy], "FACE WITH TEARS OF JOY"),
      self.new("\u{1F632}", [:astonished], "ASTONISHED FACE"),
      self.new("\u{1F631}", [:scream], "FACE SCREAMING IN FEAR"),
      self.new("\u{1F62B}", [:tired_face]),
      self.new("\u{1F620}", [:angry], "ANGRY FACE"),
      self.new("\u{1F621}", [:rage], "POUTING FACE"),
      self.new("\u{1F624}", [:triumph], "FACE WITH LOOK OF TRIUMPH"),
      self.new("\u{1F62A}", [:sleepy], "SLEEPY FACE"),
      self.new("\u{1F60B}", [:yum], "FACE SAVOURING DELICIOUS FOOD"),
      self.new("\u{1F637}", [:mask], "FACE WITH MEDICAL MASK"),
      self.new("\u{1F60E}", [:sunglasses], "SMILING FACE WITH SUNGLASSES"),
      self.new("\u{1F635}", [:dizzy_face]),
      self.new("\u{1F47F}", [:imp]),
      self.new("\u{1F608}", [:smiling_imp], "SMILING FACE WITH HORNS"),
      self.new("\u{1F610}", [:neutral_face]),
      self.new("\u{1F636}", [:no_mouth], "FACE WITHOUT MOUTH"),
      self.new("\u{1F607}", [:innocent], "SMILING FACE WITH HALO"),
      self.new("\u{1F47D}", [:alien], "EXTRATERRESTRIAL ALIEN"),
      self.new("\u{1F49B}", [:yellow_heart]),
      self.new("\u{1F499}", [:blue_heart]),
      self.new("\u{1F49C}", [:purple_heart]),
      self.new("\u{2764}" , [:heart], "HEAVY BLACK HEART"),
      self.new("\u{1F49A}", [:green_heart]),
      self.new("\u{1F494}", [:broken_heart]),
      self.new("\u{1F493}", [:heartbeat], "BEATING HEART"),
      self.new("\u{1F497}", [:heartpulse], "GROWING HEART"),
      self.new("\u{1F495}", [:two_hearts]),
      self.new("\u{1F49E}", [:revolving_hearts]),
      self.new("\u{1F498}", [:cupid], "HEART WITH ARROW"),
      self.new("\u{1F496}", [:sparkling_heart]),
      self.new("\u{2728}" , [:sparkles]),
      self.new("\u{2B50}" , [:star], "WHITE MEDIUM STAR"),
      self.new("\u{1F31F}", [:star2], "GLOWING STAR"),
      self.new("\u{1F320}", [:shooting_star], "SHOOTING STAR"),
      self.new("\u{1F4AB}", [:dizzy], "DIZZY SYMBOL"), # "circling stars, squeans"
      self.new("\u{1F4A5}", [:boom, :collision], "COLLISION SYMBOL"),
      self.new("\u{1F4A2}", [:anger], "ANGER SYMBOL"),
      self.new("\u{2757}" , [:exclamation], "HEAVY EXCLAMATION MARK SYMBOL"),
      self.new("\u{2753}" , [:question], "BLACK QUESTION MARK ORNAMENT"),
      self.new("\u{2755}" , [:grey_exclamation], "WHITE EXCLAMATION MARK ORNAMENT"),
      self.new("\u{2754}" , [:grey_question], "WHITE QUESTION MARK ORNAMENT"),
      self.new("\u{1F4A4}", [:zzz], "SLEEPING SYMBOL"),
      self.new("\u{1F4A8}", [:dash], "DASH SYMBOL"), # "running dash, briffits"
      self.new("\u{1F4A6}", [:sweat_drops], "SPLASHING SWEAT SYMBOL"), # "plewds"
      self.new("\u{1F3B6}", [:notes], "MULTIPLE MUSICAL NOTES"), # "dancing notes, mood, melody"
      self.new("\u{1F3B5}", [:musical_note]), # "music, being in good mood"
      self.new("\u{1F525}", [:fire], "FIRE"),
      self.new("\u{1F917}", [:hugging, :hugging_face], "HUGGING FACE"),
      self.new("\u{1F914}", [:thinking, :thinking_face], "THINKING FACE"),
      self.new("\u{1F644}", [:rolling_eyes, :face_with_rolling_eyes], "FACE WITH ROLLING EYES"),
      self.new("\u{1F910}", [:zipper_mouth, :zipper_mouth_face], "ZIPPER-MOUTH FACE"),
      self.new("\u{1F913}", [:nerd, :nerd_face], "NERD FACE"),
      self.new("\u{1F643}", [:upside_down, :upside_down_face], "UPSIDE-DOWN FACE"),
      self.new("\u{1F912}", [:face_thermometer, :face_with_thermometer], "FACE WITH THERMOMETER"),
      self.new("\u{1F915}", [:head_bandage, :face_with_head_bandage], "FACE WITH HEAD-BANDAGE"),
      self.new("\u{1F911}", [:money_mouth, :money_mouth_face], "MONEY-MOUTH FACE"),
      self.new("\u{1F916}", [:robot, :robot_face], "ROBOT FACE"),
      self.new("\u{1F575}", [:sleuth, :sleuth_or_spy], "SLEUTH OR SPY"),
      self.new("\u{1F3CB}", [:weight_lifter], "WEIGHT LIFTER"),
      self.new("\u{1F3CC}", [:golfer], "GOLFER"),
      self.new("\u{1F574}", [:man_levitating, :man_in_business_suit_levitating], "MAN IN BUSINESS SUIT LEVITATING"),
      self.new("\u{1F641}", [:slightly_frowning, :slightly_frowning_face], "SLIGHTLY FROWNING FACE"),
      self.new("\u{1F642}", [:slightly_smiling, :slightly_smiling_face], "SLIGHTLY SMILING FACE"),

      # Poop
      self.new("\u{1F4A9}", [:poop, :hankey, :shit], "PILE OF POO"), # "dog dirt"
      self.new("\u{1F44D}", [:thumbsup, :"+1"], "THUMBS UP SIGN"),
      self.new("\u{1F44E}", [:thumbsdown, :"-1"], "THUMBS DOWN SIGN"),
      self.new("\u{1F44C}", [:ok_hand], "OK HAND SIGN"),
      self.new("\u{1F44A}", [:punch, :facepunch], "FISTED HAND SIGN"), # "punch
      self.new("\u{270A}" , [:fist], "RAISED FIST"),
      self.new("\u{270C}" , [:v], "VICTORY HAND"),
      self.new("\u{1F44B}", [:wave], "WAVING HAND SIGN"),
      self.new("\u{270B}" , [:hand], "RAISED HAND"),
      self.new("\u{1F450}", [:open_hands], "OPEN HANDS SIGN"),
      self.new("\u{261D}" , [:point_up], "WHITE UP POINTING INDEX"),
      self.new("\u{1F447}", [:point_down], "WHITE DOWN POINTING BACKHAND INDEX"),
      self.new("\u{1F448}", [:point_left], "WHITE LEFT POINTING BACKHAND INDEX"),
      self.new("\u{1F449}", [:point_right], "WHITE RIGHT POINTING BACKHAND INDEX"),
      self.new("\u{1F64C}", [:raised_hands], "PERSON RAISING BOTH HANDS IN CELEBRATION"), # "banzai!"
      self.new("\u{1F64F}", [:pray], "PERSON WITH FOLDED HANDS"), # "can indicate sorrow or regret; can indicate pleading"
      self.new("\u{1F446}", [:point_up_2], "WHITE UP POINTING BACKHAND INDEX"),
      self.new("\u{1F44F}", [:clap], "CLAPPING HANDS SIGN"),
      self.new("\u{1F4AA}", [:muscle], "FLEXED BICEPS"), # "strong, muscled"
      self.new("\u{1F6B6}", [:walking], "PEDESTRIAN"),
      self.new("\u{1F3C3}", [:runner, :running]),
      self.new("\u{1F46B}", [:couple], "MAN AND WOMAN HOLDING HANDS"),
      self.new("\u{1F46A}", [:family]),
      self.new("\u{1F46C}", [:two_men_holding_hands]),
      self.new("\u{1F46D}", [:two_women_holding_hands]),
      self.new("\u{1F483}", [:dancer]),
      self.new("\u{1F46F}", [:dancers], "WOMAN WITH BUNNY EARS"),
      self.new("\u{1F646}", [:ok_woman], "FACE WITH OK GESTURE"),
      self.new("\u{1F645}", [:no_good], "FACE WITH NO GOOD GESTURE"),
      self.new("\u{1F481}", [:information_desk_person]),
      self.new("\u{1F64B}", [:raised_hand, :raising_hand], "HAPPY PERSON RAISING ONE HAND"),
      self.new("\u{1F470}", [:bride_with_veil]),
      self.new("\u{1F64E}", [:person_with_pouting_face]),
      self.new("\u{1F64D}", [:person_frowning, :white_frowning_face]),
      self.new("\u{1F647}", [:bow], "PERSON BOWING DEEPLY"),
      self.new("\u{1F48F}", [:couplekiss], "KISS"), # "two people kissing"
      self.new("\u{1F491}", [:couple_with_heart]),
      self.new("\u{1F486}", [:massage], "FACE MASSAGE"),
      self.new("\u{1F487}", [:haircut]), # "usually indicates a beauty parlor"
      self.new("\u{1F485}", [:nail_care], "NAIL POLISH"), # "manicure, nail care"
      self.new("\u{1F466}", [:boy]),
      self.new("\u{1F467}", [:girl]),
      self.new("\u{1F469}", [:woman]),
      self.new("\u{1F468}", [:man]),
      self.new("\u{1F476}", [:baby]),
      self.new("\u{1F475}", [:older_woman]),
      self.new("\u{1F474}", [:older_man]),
      self.new("\u{1F471}", [:person_with_blond_hair]),
      self.new("\u{1F472}", [:man_with_gua_pi_mao]),
      self.new("\u{1F473}", [:man_with_turban]),
      self.new("\u{1F477}", [:construction_worker]),
      self.new("\u{1F46E}", [:cop], "POLICE OFFICER"),
      self.new("\u{1F47C}", [:angel], "BABY ANGEL"),
      self.new("\u{1F478}", [:princess]),
      self.new("\u{1F595}", [:middle_finger], "REVERSED HAND WITH MIDDLE FINGER EXTENDED"),
      self.new("\u{1F596}", [:vulcan_salute], "RAISED HAND WITH PART BETWEEN MIDDLE AND RING FINGERS"), # vulcan salute
      self.new("\u{1F918}", [:sign_horns, :the_horns], "SIGN OF THE HORNS"),
      self.new("\u{1F590}", [:fingers_splayed, :raised_hand_with_fingers_splayed], "RAISED HAND WITH FINGERS SPLAYED"),

      # Cats
      self.new("\u{1F63A}", [:smiley_cat], "SMILING CAT FACE WITH OPEN MOUTH"),
      self.new("\u{1F638}", [:smile_cat], "GRINNING CAT FACE WITH SMILING EYES"),
      self.new("\u{1F63B}", [:heart_eyes_cat], "SMILING CAT FACE WITH HEART-SHAPED EYES"),
      self.new("\u{1F63D}", [:kissing_cat], "KISSING CAT FACE WITH CLOSED EYES"),
      self.new("\u{1F63C}", [:smirk_cat], "CAT FACE WITH WRY SMILE"),
      self.new("\u{1F640}", [:scream_cat], "WEARY CAT FACE"),
      self.new("\u{1F63F}", [:crying_cat_face], "CRYING CAT FACE"),
      self.new("\u{1F639}", [:joy_cat], "CAT FACE WITH TEARS OF JOY"),
      self.new("\u{1F63E}", [:pouting_cat], "POUTING CAT FACE"),
      self.new("\u{1F479}", [:japanese_ogre]),
      self.new("\u{1F47A}", [:japanese_goblin]),
      # Monkeys
      self.new("\u{1F648}", [:see_no_evil], "SEE-NO-EVIL MONKEY"),
      self.new("\u{1F649}", [:hear_no_evil], "HEAR-NO-EVIL MONKEY"),
      self.new("\u{1F64A}", [:speak_no_evil], "SPEAK-NO-EVIL MONKEY"),
      self.new("\u{1F482}", [:guardsman]),
      self.new("\u{1F480}", [:skull]),
      self.new("\u{1F463}", [:feet, :footprints], "FOOTPRINTS"),
      self.new("\u{1F444}", [:lips], "MOUTH"),
      self.new("\u{1F48B}", [:kiss], "KISS MARK"), # "lips"
      self.new("\u{1F4A7}", [:droplet]), # "represents a drop of sweat or drop of water"
      self.new("\u{1F442}", [:ear]),
      self.new("\u{1F440}", [:eyes]),
      self.new("\u{1F443}", [:nose]),
      self.new("\u{1F445}", [:tongue]),
      self.new("\u{1F48C}", [:love_letter]),
      self.new("\u{1F464}", [:bust_in_silhouette]), # "guest account"
      self.new("\u{1F465}", [:busts_in_silhouette]), # "accounts"
      self.new("\u{1F4AC}", [:speech_balloon]), # "comic book conversation bubble"
      self.new("\u{1F4AD}", [:thought_balloon]),
      self.new("\u{1F5E8}", [:left_speech], "LEFT SPEECH BUBBLE"),
      self.new("\u{1F5EF}", [:right_answer], "RIGHT ANSWER BUBBLE"),
      self.new("\u{1F573}", [:hole], "HOLE"),
      self.new("\u{1F576}", [:dark_sunglasses], "DARK SUNGLASSES"),
      self.new("\u{1F5E3}", [:speaking_head]),
      self.new("\u{1F441}", [:eye]),
      self.new("\u{1F3FB}", [:type_1_2]),
      self.new("\u{1F3FC}", [:type_3]),
      self.new("\u{1F3FD}", [:type_4]),
      self.new("\u{1F3FE}", [:type_5]),
      self.new("\u{1F3FF}", [:type_6]),
      self.new("\u{26d1}", [:helmet_with_white_cross], "HELMET WITH WHITE CROSS"),
      self.new("\u{270d}", [:writing_hand], "WRITING HAND"),
      self.new("\u{1f45f}", [:athletic_shoe], "ATHLETIC SHOE"),
      self.new("\u{1f596}", [:vulcan_hand, :"spock-hand"], "RAISED HAND WITH PART BETWEEN MIDDLE AND RING FINGERS"),
      self.new("\u{1f5e3}", [:speaking_head_in_silhouette], "SPEAKING HEAD IN SILHOUETTE"),
      self.new("\u{26F9}", [:person_with_ball], "PERSON WITH BALL"),
      self.new("\u{26F7}", [:skier], "SKIER"),
      self.new("\u{1F468 200D 1F468 200D 1F466}", [:"man-man-boy"], "MAN MAN BOY"),
      self.new("\u{1F468 200D 1F468 200D 1F466 200D 1F466}", [:"man-man-boy-boy"], "MAN MAN BOY BOY"),
      self.new("\u{1F468 200D 1F468 200D 1F467 200D 1F466}", [:"man-man-girl-boy"], "MAN MAN GIRL BOY"),
      self.new("\u{0000}", [:"man-man-girl-girl"], "MAN MAN GIRL GIRL"),
      self.new("\u{1F468 200D 1F468 200D 1F467}", [:"man-man-girl"], "MAN MAN GIRL"),
      self.new("\u{1F468 200D 1F469 200D 1F467 200D 1F467}", [:"man-woman-girl-girl"], "MAN WOMAN GIRL GIRL"),
      self.new("\u{1F468 200D 1F469 200D 1F466 200D 1F466}", [:"man-woman-boy-boy"], "MAN WOMAN BOY BOY"),
      self.new("\u{1F468 200D 1F469 200D 1F467}", [:"man-woman-girl"], "MAN WOMAN GIRL"),
      self.new("\u{1F468 200D 1F469 200D 1F467 200D 1F466}", [:"man-woman-girl-boy"], "MAN WOMAN GIRL BOY"),
      self.new("\u{1F469 200D 1F469 200D 1F466}", [:"woman-woman-boy"], "WOMAN WOMAN BOY"),
      self.new("\u{1F469 200D 1F469 200D 1F466 200D 1F466}", [:"woman-woman-boy-boy"], "WOMAN WOMAN BOY BOY"),
      self.new("\u{1F469 200D 1F469 200D 1F467}", [:"woman-woman-girl"], "WOMAN WOMAN GIRL"),
      self.new("\u{1F469 200D 1F469 200D 1F467 200D 1F466}", [:"woman-woman-girl-boy"], "WOMAN WOMAN GIRL BOY"),
      self.new("\u{1F469 200D 1F469 200D 1F467 200D 1F467}", [:"woman-woman-girl-girl"], "WOMAN WOMAN GIRL GIRL"),
      self.new("\u{1F469 200D 2764 FE0F 200D 1F48B 200D 1F468}", [:"woman-kiss-man"], "WOMAN KISS MAN"), # ZWJ version of U+1F48F ("couple kiss")
      self.new("\u{1F469 200D 2764 FE0F 200D 1F468}", [:"woman-heart-man"], "WOMAN HEART MAN"), # ZWJ version of U+1F491 ("couple with heart")
      self.new("\u{1F468 200D 1F469 200D 1F466}", [:"man-woman-boy"], "MAN WOMAN BOY BOY"), # ZWJ version of U+1F46A ("family")
      self.new("\u{1F468 200D 2764 FE0F 200D 1F468}", [:"man-heart-man"], "MAN HEART MAN"),
      self.new("\u{1F468 200D 2764 FE0F 200D 1F48B 200D 1F468}", [:"man-kiss-man"], "MAN KISS MAN"),
      self.new("\u{1F469 200D 2764 FE0F 200D 1F469}", [:"woman-heart-woman"], "WOMAN HEART WOMAN"),
      self.new("\u{1F469 200D 2764 FE0F 200D 1F48B 200D 1F469}", [:"woman-kiss-woman"], "WOMAN KISS WOMAN"),
      self.new("\u{1F922}", [:nauseated_face], "NAUSEATED FACE"),
      self.new("\u{u2639 FE0F}", [:frowning_face], "WHITE FROWNING FACE")
    ]
  end
end
