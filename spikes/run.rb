puts "Running long test"
puts `ruby long_document/long_document_test.rb`

puts "Running many test"
puts `ruby many_documents/many_documents_test.rb`

#
# Mongo
#
#   Running long test
#   
#   drop: 0.015529
#   insert small: 0.001176
#   insert long: 0.338319
#   read small: 0.001818
#   read long: 0.369172
#   
#   Running many test
#   
#   drop: 0.016035
#   insert many: 69.929756
#   read one 1: 4.2e-05
#   read one 9999: 4.3e-05
#   read many: 4.1e-05
#   read one with count: 0.366798
#   read many with count: 0.297097

#
# Mongo Ext
#
#   Running long test
#
#   drop: 0.032676
#   insert small: 0.000901
#   insert long: 0.31016
#   read small: 0.001364
#   read long: 0.084268
#   
#   Running many test
#
#   drop: 0.00295
#   insert many: 46.837418
#   read one 1: 4.5e-05
#   read one 9999: 4.1e-05
#   read many: 4.0e-05
#   read one with count: 0.338423
#   read many with count: 0.391827

#
# Document size
#
# (company bytes)15+
# (5 projects)50+
# ((days)200*
#  (activities/day)3*
#   ((note)60+
#     (name)15+
#     (date)12))
# = 52265
