# Build a nested HoH of the classification of biological life on Earth based
# on these commented-out snippets assigned to PORTION_1-PORTION_4. Return
# that HoH as the return value for the method "naming_system."
#
# The tests will guide your construction.
#
# PORTION_1 = {
#   label: "Kingdom",
#   sub_category: {
#     label: "Phylum",
#     sub_category: {
#       label: "Class"
#     }
#   }
# }
# 
# PORTION_2 = {
#   label: "Order"
# }
# 
# PORTION_3 = {
#   label: "Family",
#   sub_category: {
#     label: "Genus",
#   }
# }
# 
# PORTION_4 = {
#   label: "Species",
#   sub_category: nil
# }



def naming_system
  # Remember:
  #  Kingdom
  #  Phylum
  #  Class
  #  Order
  #  Family
  #  Genus
  #  Species
  # So, if we have the "Kingdom" node we should be able to "tunnel" into the
  # HoH all the way to Species!
  kng = {label: "Kingdom", sub_category: {}}
  phy = {label: "Phylum", sub_category: {}}
  cla = {label: "Class", sub_category: {}}
  ord = {label: "Order", sub_category: {}}
  fam = {label: "Family", sub_category: {}}
  gen = {label: "Genus", sub_category: {}}
  spe = {label: "Species", sub_category: nil}
  gen[:sub_category] = spe
  fam[:sub_category] = gen
  ord[:sub_category] = fam
  cla[:sub_category] = ord
  phy[:sub_category] = cla
  kng[:sub_category] = phy  
  return kng #15 lines
end 

def name_system2
  taxa = %w[Kingdom Phylum Class Order Family Genus Species] 
  taxa2 = []
  array_index = 0
  while array_index < taxa.length do
     taxa2.push({label: taxa[array_index], sub_category: {}})
     array_index += 1
  end
  taxa2[-1][:sub_category] = nil
  taxa2.reverse! #now [species, genus, . . . kingdom]
  while taxa2.length > 1 #want to start nesting
    taxa2[1][:sub_category] = taxa2.shift
  end
  return taxa2[0]
end #14 lines. much logic. very fun. could shorten with pop. or change the array taxa

puts naming_system
puts name_system2
