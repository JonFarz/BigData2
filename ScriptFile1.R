# TODO: Add comment
# 
# Author: Jonny
###############################################################################

library(arules)

memory.size(20000)


f <- file("http://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data")

data <- read.table(f, sep=",", header=F)

#summary(data)

cnames <- list("EatIt","CapShape","Cap-Surface","cap-color","bruises","odor","gill-attachment","gill-spacing","gill-size","gill-color",
		"stalk-shape","stalk-root","stalk-surface-above-ring","stalk-surface-below-ring","stalk-color-above-ring","stalk-color-below-ring"
				,"veil-type","veil-color","ring-number","ring-type","spore-print-color","population","habitat")

colnames(data) <- cnames

#eatornot
levels(data$EatIt)[match("p",levels(data$EatIt))] <- "poisonous"
levels(data$EatIt)[match("e",levels(data$EatIt))] <- "edible"
#data$EatIt

#CapShape
levels(data$CapShape)[match("b",levels(data$CapShape))] <- "bell"
levels(data$CapShape)[match("c",levels(data$CapShape))] <- "conical"
levels(data$CapShape)[match("x",levels(data$CapShape))] <- "convex"
levels(data$CapShape)[match("f",levels(data$CapShape))] <- "flat"
levels(data$CapShape)[match("k",levels(data$CapShape))] <- "knobbed"
levels(data$CapShape)[match("s",levels(data$CapShape))] <- "sunken"
#data$CapShape

#cap-surface:              fibrous=f,grooves=g,scaly=y,smooth=s
levels(data$`Cap-Surface`)[match("s",levels(data$`Cap-Surface`))] <- "smooth"
levels(data$`Cap-Surface`)[match("f",levels(data$`Cap-Surface`))] <- "fibrous"
levels(data$`Cap-Surface`)[match("g",levels(data$`Cap-Surface`))] <- "grooves"
levels(data$`Cap-Surface`)[match("y",levels(data$`Cap-Surface`))] <- "scaly"
#data$`Cap-Surface`

#cap-color:                brown=n,buff=b,cinnamon=c,gray=g,green=r,pink=p,purple=u,red=e,white=w,yellow=y
levels(data$`cap-color`)[match("n",levels(data$`cap-color`))] <- "brown"
levels(data$`cap-color`)[match("b",levels(data$`cap-color`))] <- "buff"
levels(data$`cap-color`)[match("c",levels(data$`cap-color`))] <- "cinnamon"
levels(data$`cap-color`)[match("g",levels(data$`cap-color`))] <- "gray"
levels(data$`cap-color`)[match("r",levels(data$`cap-color`))] <- "green"
levels(data$`cap-color`)[match("p",levels(data$`cap-color`))] <- "pink"
levels(data$`cap-color`)[match("u",levels(data$`cap-color`))] <- "purple"
levels(data$`cap-color`)[match("e",levels(data$`cap-color`))] <- "red"
levels(data$`cap-color`)[match("w",levels(data$`cap-color`))] <- "white"
levels(data$`cap-color`)[match("y",levels(data$`cap-color`))] <- "yellow"
#data$`cap-color`

#bruises?:                 bruises=t,no=f
levels(data$bruises)[match("t",levels(data$bruises))] <- "bruises"
levels(data$bruises)[match("f",levels(data$bruises))] <- "no_bruises"
#data$bruises

#odor:                     almond=a,anise=l,creosote=c,fishy=y,foul=f,musty=m,none=n,pungent=p,spicy=s
levels(data$odor)[match("a",levels(data$odor))] <- "almond"
levels(data$odor)[match("l",levels(data$odor))] <- "anise"
levels(data$odor)[match("c",levels(data$odor))] <- "creosote"
levels(data$odor)[match("y",levels(data$odor))] <- "fishy"
levels(data$odor)[match("f",levels(data$odor))] <- "foul"
levels(data$odor)[match("m",levels(data$odor))] <- "musty"
levels(data$odor)[match("n",levels(data$odor))] <- "none"
levels(data$odor)[match("p",levels(data$odor))] <- "pungent"
levels(data$odor)[match("s",levels(data$odor))] <- "spicy"
#data$odor

#gill-attachment:          attached=a,descending=d,free=f,notched=n
levels(data$`gill-attachment`)[match("a",levels(data$`gill-attachment`))] <- "attached"
levels(data$`gill-attachment`)[match("d",levels(data$`gill-attachment`))] <- "descending"
levels(data$`gill-attachment`)[match("f",levels(data$`gill-attachment`))] <- "free"
levels(data$`gill-attachment`)[match("n",levels(data$`gill-attachment`))] <- "notched"
#data$`gill-attachment`

#gill-spacing:             close=c,crowded=w,distant=d
levels(data$`gill-spacing`)[match("c",levels(data$`gill-spacing`))] <- "close"
levels(data$`gill-spacing`)[match("w",levels(data$`gill-spacing`))] <- "crowded"
levels(data$`gill-spacing`)[match("d",levels(data$`gill-spacing`))] <- "distant"
#data$`gill-spacing`

#gill-size:                broad=b,narrow=n
levels(data$`gill-size`)[match("b",levels(data$`gill-size`))] <- "broad"
levels(data$`gill-size`)[match("n",levels(data$`gill-size`))] <- "narrow"
#data$`gill-size`

#gill-color:               black=k,brown=n,buff=b,chocolate=h,gray=g,green=r,orange=o,pink=p,purple=u,red=e,white=w,yellow=y
levels(data$`gill-color`)[match("k",levels(data$`gill-color`))] <- "black"
levels(data$`gill-color`)[match("n",levels(data$`gill-color`))] <- "brown"
levels(data$`gill-color`)[match("b",levels(data$`gill-color`))] <- "buff"
levels(data$`gill-color`)[match("h",levels(data$`gill-color`))] <- "chocolate"
levels(data$`gill-color`)[match("g",levels(data$`gill-color`))] <- "gray"
levels(data$`gill-color`)[match("r",levels(data$`gill-color`))] <- "green"
levels(data$`gill-color`)[match("o",levels(data$`gill-color`))] <- "orange"
levels(data$`gill-color`)[match("p",levels(data$`gill-color`))] <- "pink"
levels(data$`gill-color`)[match("u",levels(data$`gill-color`))] <- "purple"
levels(data$`gill-color`)[match("e",levels(data$`gill-color`))] <- "red"
levels(data$`gill-color`)[match("w",levels(data$`gill-color`))] <- "white"
levels(data$`gill-color`)[match("y",levels(data$`gill-color`))] <- "yellow"
#data$`gill-color`

#stalk-shape:              enlarging=e,tapering=t
levels(data$`stalk-shape`)[match("e",levels(data$`stalk-shape`))] <- "enlarging"
levels(data$`stalk-shape`)[match("t",levels(data$`stalk-shape`))] <- "tapering"
#data$`stalk-shape`

#stalk-root:               bulbous=b,club=c,cup=u,equal=e,rhizomorphs=z,rooted=r,missing=?
levels(data$`stalk-root`)[match("b",levels(data$`stalk-root`))] <- "bulbous"
levels(data$`stalk-root`)[match("c",levels(data$`stalk-root`))] <- "club"
levels(data$`stalk-root`)[match("u",levels(data$`stalk-root`))] <- "cup"
levels(data$`stalk-root`)[match("e",levels(data$`stalk-root`))] <- "equal"
levels(data$`stalk-root`)[match("z",levels(data$`stalk-root`))] <- "rhizomorphs"
levels(data$`stalk-root`)[match("r",levels(data$`stalk-root`))] <- "rooted"
levels(data$`stalk-root`)[match("?",levels(data$`stalk-root`))] <- "missing"
#data$`stalk-root`

#stalk-surface-above-ring: fibrous=f,scaly=y,silky=k,smooth=s
levels(data$`stalk-surface-above-ring`)[match("f",levels(data$`stalk-surface-above-ring`))] <- "fibrous"
levels(data$`stalk-surface-above-ring`)[match("y",levels(data$`stalk-surface-above-ring`))] <- "scaly"
levels(data$`stalk-surface-above-ring`)[match("k",levels(data$`stalk-surface-above-ring`))] <- "silky"
levels(data$`stalk-surface-above-ring`)[match("s",levels(data$`stalk-surface-above-ring`))] <- "smooth"
#data$`stalk-surface-above-ring`

#stalk-surface-below-ring: fibrous=f,scaly=y,silky=k,smooth=s
levels(data$`stalk-surface-below-ring`)[match("f",levels(data$`stalk-surface-below-ring`))] <- "fibrous"
levels(data$`stalk-surface-below-ring`)[match("y",levels(data$`stalk-surface-below-ring`))] <- "scaly"
levels(data$`stalk-surface-below-ring`)[match("k",levels(data$`stalk-surface-below-ring`))] <- "silky"
levels(data$`stalk-surface-below-ring`)[match("s",levels(data$`stalk-surface-below-ring`))] <- "smooth"
#data$`stalk-surface-below-ring`

#stalk-color-above-ring:   brown=n,buff=b,cinnamon=c,gray=g,orange=o,pink=p,red=e,white=w,yellow=y
levels(data$`stalk-color-above-ring`)[match("b",levels(data$`stalk-color-above-ring`))] <- "buff"
levels(data$`stalk-color-above-ring`)[match("n",levels(data$`stalk-color-above-ring`))] <- "brown"
levels(data$`stalk-color-above-ring`)[match("g",levels(data$`stalk-color-above-ring`))] <- "gray"
levels(data$`stalk-color-above-ring`)[match("o",levels(data$`stalk-color-above-ring`))] <- "orange"
levels(data$`stalk-color-above-ring`)[match("p",levels(data$`stalk-color-above-ring`))] <- "pink"
levels(data$`stalk-color-above-ring`)[match("c",levels(data$`stalk-color-above-ring`))] <- "cinnamon"
levels(data$`stalk-color-above-ring`)[match("e",levels(data$`stalk-color-above-ring`))] <- "red"
levels(data$`stalk-color-above-ring`)[match("w",levels(data$`stalk-color-above-ring`))] <- "white"
levels(data$`stalk-color-above-ring`)[match("y",levels(data$`stalk-color-above-ring`))] <- "yellow"
#data$`stalk-color-above-ring`

#stalk-color-below-ring:   brown=n,buff=b,cinnamon=c,gray=g,orange=o,pink=p,red=e,white=w,yellow=y
levels(data$`stalk-color-below-ring`)[match("b",levels(data$`stalk-color-below-ring`))] <- "buff"
levels(data$`stalk-color-below-ring`)[match("n",levels(data$`stalk-color-below-ring`))] <- "brown"
levels(data$`stalk-color-below-ring`)[match("g",levels(data$`stalk-color-below-ring`))] <- "gray"
levels(data$`stalk-color-below-ring`)[match("o",levels(data$`stalk-color-below-ring`))] <- "orange"
levels(data$`stalk-color-below-ring`)[match("p",levels(data$`stalk-color-below-ring`))] <- "pink"
levels(data$`stalk-color-below-ring`)[match("c",levels(data$`stalk-color-below-ring`))] <- "cinnamon"
levels(data$`stalk-color-below-ring`)[match("e",levels(data$`stalk-color-below-ring`))] <- "red"
levels(data$`stalk-color-below-ring`)[match("w",levels(data$`stalk-color-below-ring`))] <- "white"
levels(data$`stalk-color-below-ring`)[match("y",levels(data$`stalk-color-below-ring`))] <- "yellow"
#data$`stalk-color-below-ring`


#veil-type:                partial=p,universal=u
levels(data$`veil-type`)[match("p",levels(data$`veil-type`))] <- "partial"
levels(data$`veil-type`)[match("u",levels(data$`veil-type`))] <- "universal"
#data$`veil-type`

#veil-color:               brown=n,orange=o,white=w,yellow=y
levels(data$`veil-color`)[match("w",levels(data$`veil-color`))] <- "white"
levels(data$`veil-color`)[match("y",levels(data$`veil-color`))] <- "yellow"
levels(data$`veil-color`)[match("o",levels(data$`veil-color`))] <- "orange"
levels(data$`veil-color`)[match("n",levels(data$`veil-color`))] <- "brown"
#data$`veil-color`

#ring-number:              none=n,one=o,two=t
levels(data$`ring-number`)[match("n",levels(data$`ring-number`))] <- "none"
levels(data$`ring-number`)[match("t",levels(data$`ring-number`))] <- "two"
levels(data$`ring-number`)[match("o",levels(data$`ring-number`))] <- "one"
#data$`ring-number`


#ring-type:                cobwebby=c,evanescent=e,flaring=f,large=l,none=n,pendant=p,sheathing=s,zone=z
levels(data$`ring-type`)[match("c",levels(data$`ring-type`))] <- "cobwebby"
levels(data$`ring-type`)[match("e",levels(data$`ring-type`))] <- "evanescent"
levels(data$`ring-type`)[match("f",levels(data$`ring-type`))] <- "flaring"
levels(data$`ring-type`)[match("l",levels(data$`ring-type`))] <- "large"
levels(data$`ring-type`)[match("n",levels(data$`ring-type`))] <- "none"
levels(data$`ring-type`)[match("p",levels(data$`ring-type`))] <- "pendant"
levels(data$`ring-type`)[match("s",levels(data$`ring-type`))] <- "sheathing"
levels(data$`ring-type`)[match("z",levels(data$`ring-type`))] <- "zone"
#data$`ring-type`

#spore-print-color:        black=k,brown=n,buff=b,chocolate=h,green=r,orange=o,purple=u,white=w,yellow=y
levels(data$`spore-print-color`)[match("k",levels(data$`spore-print-color`))] <- "black"
levels(data$`spore-print-color`)[match("n",levels(data$`spore-print-color`))] <- "brown"
levels(data$`spore-print-color`)[match("b",levels(data$`spore-print-color`))] <- "buff"
levels(data$`spore-print-color`)[match("h",levels(data$`spore-print-color`))] <- "chocolate"
levels(data$`spore-print-color`)[match("g",levels(data$`spore-print-color`))] <- "gray"
levels(data$`spore-print-color`)[match("r",levels(data$`spore-print-color`))] <- "green"
levels(data$`spore-print-color`)[match("o",levels(data$`spore-print-color`))] <- "orange"
levels(data$`spore-print-color`)[match("p",levels(data$`spore-print-color`))] <- "pink"
levels(data$`spore-print-color`)[match("u",levels(data$`spore-print-color`))] <- "purple"
levels(data$`spore-print-color`)[match("e",levels(data$`spore-print-color`))] <- "red"
levels(data$`spore-print-color`)[match("w",levels(data$`spore-print-color`))] <- "white"
levels(data$`spore-print-color`)[match("y",levels(data$`spore-print-color`))] <- "yellow"
#data$`spore-print-color`

#population:               abundant=a,clustered=c,numerous=n,scattered=s,several=v,solitary=y
levels(data$population)[match("a",levels(data$population))] <- "abundant"
levels(data$population)[match("c",levels(data$population))] <- "clustered"
levels(data$population)[match("n",levels(data$population))] <- "numerous"
levels(data$population)[match("s",levels(data$population))] <- "scattered"
levels(data$population)[match("v",levels(data$population))] <- "serveral"
levels(data$population)[match("y",levels(data$population))] <- "solitary"
#data$population


#habitat:                  grasses=g,leaves=l,meadows=m,paths=p,urban=u,waste=w,woods=d
levels(data$habitat)[match("g",levels(data$habitat))] <- "grasses"
levels(data$habitat)[match("l",levels(data$habitat))] <- "leaves"
levels(data$habitat)[match("m",levels(data$habitat))] <- "meadows"
levels(data$habitat)[match("p",levels(data$habitat))] <- "paths"
levels(data$habitat)[match("u",levels(data$habitat))] <- "urban"
levels(data$habitat)[match("w",levels(data$habitat))] <- "waste"
levels(data$habitat)[match("d",levels(data$habitat))] <- "woods"
#data$habitat

rules <- apriori(data,control = list(verbose=F),
		parameter = list(minlen=2, supp=0.005, conf=0.8), 
		appearance = list(rhs=c("EatIt=edible","EatIt=poisonous"),
				default="lhs"))

inspect(rules)
#quality(rules) <- round(quality(rules), digits=3)

#rules.sorted <- sort(rules, by="lift")

#inspect(rules.sorted)