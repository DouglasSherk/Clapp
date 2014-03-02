# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140302185528) do

  create_table "categories", force: true do |t|
    t.integer "catid"
    t.string  "catlabel"
  end

  create_table "compensation_infos", force: true do |t|
    t.string  "bn"
    t.string  "fpe"
    t.integer "f300"
    t.integer "f305"
    t.integer "f310"
    t.integer "f315"
    t.integer "f320"
    t.integer "f325"
    t.integer "f330"
    t.integer "f335"
    t.integer "f340"
    t.integer "f345"
    t.integer "f370"
    t.decimal "f380", precision: 14, scale: 2
    t.decimal "f390", precision: 14, scale: 2
  end

  create_table "donees", force: true do |t|
    t.string  "bn1"
    t.string  "fpe"
    t.integer "n"
    t.string  "bn2"
    t.string  "name"
    t.string  "associated"
    t.string  "city"
    t.string  "province"
    t.decimal "totalgifts",      precision: 14, scale: 2
    t.decimal "giftsinkind",     precision: 14, scale: 2
    t.decimal "designatedgifts", precision: 14, scale: 2
  end

  create_table "financials", force: true do |t|
    t.string  "bn"
    t.string  "fpe"
    t.string  "form"
    t.string  "f4020"
    t.string  "f4050"
    t.decimal "f4100", precision: 14, scale: 2
    t.decimal "f4110", precision: 14, scale: 2
    t.decimal "f4120", precision: 14, scale: 2
    t.decimal "f4130", precision: 14, scale: 2
    t.decimal "f4140", precision: 14, scale: 2
    t.decimal "f4150", precision: 14, scale: 2
    t.decimal "f4155", precision: 14, scale: 2
    t.decimal "f4160", precision: 14, scale: 2
    t.decimal "f4165", precision: 14, scale: 2
    t.decimal "f4166", precision: 14, scale: 2
    t.decimal "f4170", precision: 14, scale: 2
    t.decimal "f4180", precision: 14, scale: 2
    t.decimal "f4200", precision: 14, scale: 2
    t.decimal "f4250", precision: 14, scale: 2
    t.decimal "f4300", precision: 14, scale: 2
    t.decimal "f4310", precision: 14, scale: 2
    t.decimal "f4320", precision: 14, scale: 2
    t.decimal "f4330", precision: 14, scale: 2
    t.decimal "f4350", precision: 14, scale: 2
    t.string  "f4400"
    t.string  "f4490"
    t.decimal "f4500", precision: 14, scale: 2
    t.decimal "f5610", precision: 14, scale: 2
    t.decimal "f4505", precision: 14, scale: 2
    t.decimal "f4510", precision: 14, scale: 2
    t.decimal "f4530", precision: 14, scale: 2
    t.decimal "f4540", precision: 14, scale: 2
    t.decimal "f4550", precision: 14, scale: 2
    t.decimal "f4560", precision: 14, scale: 2
    t.string  "f4565"
    t.decimal "f4570", precision: 14, scale: 2
    t.decimal "f4575", precision: 14, scale: 2
    t.decimal "f4580", precision: 14, scale: 2
    t.decimal "f4590", precision: 14, scale: 2
    t.decimal "f4600", precision: 14, scale: 2
    t.decimal "f4610", precision: 14, scale: 2
    t.decimal "f4620", precision: 14, scale: 2
    t.decimal "f4630", precision: 14, scale: 2
    t.decimal "f4640", precision: 14, scale: 2
    t.decimal "f4650", precision: 14, scale: 2
    t.string  "f4655"
    t.decimal "f4700", precision: 14, scale: 2
    t.decimal "f4800", precision: 14, scale: 2
    t.decimal "f4810", precision: 14, scale: 2
    t.decimal "f4820", precision: 14, scale: 2
    t.decimal "f4830", precision: 14, scale: 2
    t.decimal "f4840", precision: 14, scale: 2
    t.decimal "f4850", precision: 14, scale: 2
    t.decimal "f4860", precision: 14, scale: 2
    t.decimal "f4870", precision: 14, scale: 2
    t.decimal "f4880", precision: 14, scale: 2
    t.decimal "f4890", precision: 14, scale: 2
    t.decimal "f4891", precision: 14, scale: 2
    t.decimal "f4900", precision: 14, scale: 2
    t.decimal "f4910", precision: 14, scale: 2
    t.decimal "f4920", precision: 14, scale: 2
    t.string  "f4930"
    t.decimal "f4950", precision: 14, scale: 2
    t.decimal "f5000", precision: 14, scale: 2
    t.decimal "f5010", precision: 14, scale: 2
    t.decimal "f5020", precision: 14, scale: 2
    t.decimal "f5030", precision: 14, scale: 2
    t.decimal "f5040", precision: 14, scale: 2
    t.decimal "f5050", precision: 14, scale: 2
    t.decimal "f5100", precision: 14, scale: 2
    t.decimal "f5500", precision: 14, scale: 2
    t.decimal "f5510", precision: 14, scale: 2
    t.decimal "f5750", precision: 14, scale: 2
    t.decimal "f5900", precision: 14, scale: 2
    t.decimal "f5910", precision: 14, scale: 2
  end

  create_table "general_infos", force: true do |t|
    t.string  "bn"
    t.string  "fpe"
    t.string  "program1code"
    t.integer "program1percentage"
    t.string  "program1descreng"
    t.string  "program1descrfre"
    t.string  "program2code"
    t.integer "program2percentage"
    t.string  "program2descreng"
    t.string  "program2descrfre"
    t.string  "program3code"
    t.integer "program3percentage"
    t.string  "program3descreng"
    t.string  "program3descrfre"
    t.string  "f1510"
    t.string  "f1510bn"
    t.string  "f1510name"
    t.string  "f1570"
    t.string  "f1600"
    t.string  "f1800"
    t.string  "f2000"
    t.string  "f2100"
    t.string  "f2400"
    t.decimal "f5030",              precision: 14, scale: 2
    t.string  "f2500"
    t.string  "f2510"
    t.string  "f2530"
    t.string  "f2540"
    t.string  "f2550"
    t.string  "f2560"
    t.string  "f2570"
    t.string  "f2575"
    t.string  "f2580"
    t.string  "f2590"
    t.string  "f2600"
    t.string  "f2610"
    t.string  "f2620"
    t.string  "f2630"
    t.string  "f2640"
    t.string  "f2650"
    t.string  "f2660"
    t.string  "f2700"
    t.decimal "f5450",              precision: 14, scale: 2
    t.decimal "f5460",              precision: 14, scale: 2
    t.string  "f2730"
    t.string  "f2740"
    t.string  "f2750"
    t.string  "f2760"
    t.string  "f2770"
    t.string  "f2780"
    t.string  "f2790"
    t.string  "f2800"
    t.string  "f3200"
    t.string  "f3400"
    t.string  "f3900"
    t.string  "f4000"
    t.string  "f5800"
    t.string  "f5810"
    t.string  "f5820"
  end

  create_table "idents", force: true do |t|
    t.string  "bn"
    t.integer "category"
    t.string  "designation"
    t.string  "legalname"
    t.string  "accountname"
    t.string  "addressline1"
    t.string  "addressline2"
    t.string  "city"
    t.string  "province"
    t.string  "postalcode"
    t.string  "country"
    t.string  "publiccontactname"
    t.string  "phone"
    t.string  "email"
    t.string  "website"
    t.decimal "average_rating"
  end

end
