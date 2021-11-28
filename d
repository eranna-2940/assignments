

        // Declared & Assigned
        const rootElement = document.getElementById('root'); 

        // Declared & Assigned
        const colors = [
            {
                color: "red",
                symbols: ["energy", "strength", "power", "courage"]
            },

            {
                color: "blue",
                symbols: ["loyalty", "trust", "stability", "confidence"]
            },

            {
                color: "orange",
                symbols: ["excitment", "fun", "haste", "action"]
            },

            {
                color: "green",
                symbols: ["cheerfulness", "happiness", "joy", "optimism"]
            }
        ];

        // function expression for li's
        const res = Object.keys(colors).map(function(ele,index){
            console.log(ele);

            const res1 = colors[ele].symbols;
            console.log(res1);

            // For CSS colors
            const colorValues = colors[ele].color;
            console.log(colorValues);

            const myStyle = {
                color:colorValues,
                fontSize:'1.3rem'
            }

            return (res1.map(function(ele1,index){
                console.log(ele1);

                // Inline CSS Style
                return <li key={index} style={myStyle}>{ele1}</li>;
            }))
        })
        
        // function expression
        const result = function(props){
            return(
                <div>

                    <h1>
                        All Colors
                    </h1>

                    <ol>

                        {
                            colors.map(function(ele,index){
                                return <li key={index} style={{fontSize:'1.3rem'}}>{ele.color[0].toUpperCase() + ele.color.slice(1)}</li>
                            })
                        }
                        
                    </ol>

                    <h2>
                        All Symbols 
                    </h2>

                    <ol>
                        {
                            res
                        }
                    </ol>

                </div>
            )
        }

        ReactDOM.render(result(colors),rootElement);
        
    //<div>
    <h1>Colors & it's symbols - object</h1>

    {Object.keys(colors).map(ele=>{
           return  <h3>{ele.toUpperCase()}</h3>  
              
        
     {colors.map((item,i)=>{
          return <li value={i}>{item}</li>
     })}
  
          const ele = ( 
            <div>
                  <h1>Colors & it's symbols</h1>
                  {object.keys(colors).map(ele => {
                      return ( 
                          <div>
                        <h3>{ele.toUpperCase()}</h3>
                           <ol>
                               {colors[ele].map(el=>{
                                   return <li>{el}</li>
                               })}
                            
                            </ol>
                           
                        </div>
                      )
                  })}


     </div>










function tasklist(props){
    const {allTasks,handleSetAllTasksUpdation} = props
    const handleTaskStatusChange=(e,id)=>{
        const result=allTasks.map((task)=>{
            if(id===task.id){
                return{...task,...{completed:statusUpdated}}
            }else{
                return{...task}
            }
        })
        handleSetAllTasksUpdation(result)
    }
    return(

        <div>
            {allTasks.map((task)=>{
                return <li key={task.id}>

                <input type="checkbox" checked={task.completed}  onChange={(e)=>handleTaskStatusChange(e,task.id)} />
                {task.title}
                </li>
            })}
        

        </div>
    )
}

function ProgressBar(props){
    const{totalTasksLength,progress}=props

   return(
       <div>
          
         <progrees value={progress} max={totalTasksLength}> </progrees>

         
         </div>
   )

}
const getCompeltedTasks=(arr)=>{
    const result=arr.filter((task)=> task.completed)
    return result
}
 function TaskContainer(props){
     const{tasks}=props
     const[allTasks,setAllTasks]=useState(tasks)

     const totalTasksLength=allTasks.length
     const intialProgress=getCompeltedTasks(allTasks)

     const [progress,setProgress]=useState(intialProgress)

     const handleSetAllTasksUpdation=(arr)=>{
         setAllTasks(arr)
         const newCompeletedTasks=getCompeltedTasks(arr)
         setProgress(newCompeletedTasks)
     }
     return(
         <div>
             <h2>Listing tasks - {allTasks.length}</h2>
             <progressBar totalTasksLength={totalTasksLength} progrees={progrees} />
             <tasklist allTasks={allTasks} handleSetAllTasksUpdation={handleSetAllTasksUpdation}/>
             
             
             </div>
     )
 }