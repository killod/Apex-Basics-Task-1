public class CustomIterator implements Iterator<Contact>{ 
   private List<Contact> contacts;
   private Integer currentIndex;
 
   public CustomIterator(List<Contact> contacts){
       this.contacts = contacts;
       this.currentIndex = 0;
   }
 
   public boolean hasNext(){ 
       return currentIndex < contacts.size() - 1;
   }    
 
   public Contact next(){
       if(hasNext()) {
           currentIndex++;
           return contacts[currentIndex];
       } else {
           throw new NoSuchElementException();
       }
   } 
}