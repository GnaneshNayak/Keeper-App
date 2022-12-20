import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper{

  public type Note={
    title:Text;
    content:Text;
  };

  stable var notes:List.List<Note> = List.nil<Note>();
  Debug.print(debug_show(notes));

  public func createNotes(titleText:Text,contentText:Text){

    let newNotes:Note={
      title=titleText;
      content=contentText;
    };
    notes:=List.push(newNotes,notes);
    Debug.print(debug_show(notes))
  };

  public query func readNotes():async [Note] {
    return List.toArray(notes);   
  };
  public func removeNote(id:Nat){

    let listFront=List.take(notes,id); 
    let listBack=List.drop(notes,id+1);  
    notes:= List.append(listFront,listBack);
  };
  

}
// import List "mo:base/List";
// actor {
//   var notes:List.List<Text> = List.nil<Text>();
//   notes:=List.push("A",notes);
//   notes:=List.push("b",notes);
//   notes:=List.push("c",notes);
//   notes:=List.push("d",notes);

//   public query func check():async List.List<Text>{
//     return notes;
//   };
//   public func take(id:Nat){
//      notes:= List.take(notes,id);
//   };
//   public query func drop(id:Nat){
//     notes:= List.drop(notes,id);
//   };

  



  
// // };