const mongoose = require('mongoose');

const { Schema } = mongoose;

const projects = new Schema(
  {
    Name: {
      type: String,
      required: 'Name cannot be blank'
    },
    skills: {
      type: String,
      required: 'skills  cannot be blank'
    },
    information: {
      type: String,
      required: 'information  cannot be blank'
    },
    averageOfprice: {
      type: Number,
      required: 'task2  cannot be blank'
    }
  },
  { collection: 'task' }
);

module.exports = mongoose.model('project', projects);