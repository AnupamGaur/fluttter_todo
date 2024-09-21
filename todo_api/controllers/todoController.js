const Todo = require('../models/todoModel')

const getTodos = async (req,res) => {
  try{
    const allTodos = await Todo.find()
    return(
      res.status(200).json({
        "allTodos":allTodos
      })
    )
  }catch{
    return res.status(500).json({
      "msg":"Could not complete your req"
    })
  }
  }

  const createTodo = async(req,res) => {
    const {title,body,completed} = req.body
    try{
      Todo.insertOne({
        title:title,
        body:body,
        completed:completed
      })
      return res.status(200).json({
        "msg":"Todo created successfully"
      })
    } catch(e){
      console.log(e)
      return res.status(500).json({
        "msg":"Todo not created"
      })
    }
  }

  const updateTodo = async (req,res) => {
    const id = req.params.id
    try {
    const updateTodo = Todo.findByIdAndUpdate(id,req.body)
    if(!updateTodo) return res.status(400).json({
      "msg":"Todo Does not exist"
    })
    return res.status(200).json({
      "msg":"ToDO updated Successfully"
    })
    }catch(e){
      console.log(e)
      res.status(500).json(
        {
          "msg":"req could not be completed"
        }
        )
    }
    }

    const deleteTodo = async(req,res) => {
      try{
        const deletedTodo = Todo.findByIdAndDelete(req.param.id)
        if (!deletedTodo) return res.status(400).json({
          "msg":"No todo found with the given id"
        })
        return res.status(200).json({
          "msg":"deleted Successfully"
        }) 
      }catch(e){
        console.log(e)
        res.status(500).json({
          "msg":"req could not be completed"
        })
      }
    }

    module.exports = {
      createTodo,
      getTodos,
      updateTodo,
      deleteTodo
    }
  