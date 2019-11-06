const db = require("../db.js");

function find() {
    return db.select("*")
    .from("schemes");
};

function findById(id) {
    return db("schemes")
    .where({ id });
};

function findSteps(id) {
    return db("steps")
    .from("schemes")
    .innerJoin("steps", "schemes.id", "steps.scheme_id")
    .select(
        "steps.id",
        "schemes.scheme_name",
        "steps.step_number",
        "steps.instructions"
    )
    .orderBy("steps.step_number")
    .where({ scheme_id: id });
};

function add(scheme) {
    return db("schemes")
    .insert(scheme);
};

function update(changes, id) {
    return db("schemes")
    .update(changes)
    .where({ id });
};

function remove(id) {
    return db("schemes")
    .delete()
    .where({ id });
};

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}