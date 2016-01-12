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

ActiveRecord::Schema.define(version: 20160110210502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "compras", force: true do |t|
    t.integer  "orden_id"
    t.integer  "item_inventario_id"
    t.integer  "cantidad_comprada"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "compras", ["item_inventario_id"], name: "index_compras_on_item_inventario_id", using: :btree
  add_index "compras", ["orden_id"], name: "index_compras_on_orden_id", using: :btree

  create_table "item_inventarios", force: true do |t|
    t.integer  "supermercado_id"
    t.string   "nombre_producto"
    t.integer  "cantidad_disponible"
    t.integer  "precio"
    t.string   "unidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_inventarios", ["supermercado_id"], name: "index_item_inventarios_on_supermercado_id", using: :btree

  create_table "ordens", force: true do |t|
    t.integer  "usuario_id"
    t.string   "direccion"
    t.string   "estado_de_orden"
    t.string   "plazo_de_entrega"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ordens", ["usuario_id"], name: "index_ordens_on_usuario_id", using: :btree

  create_table "supermercados", force: true do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "numero_telefono"
    t.string "region"
    t.time   "hora_de_apertura"
    t.time   "hora_de_cierre"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "usuarios", force: true do |t|
    t.string   "nombre"
    t.string   "password_digest"
    t.string   "email"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
