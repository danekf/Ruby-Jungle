context('Add to Cart', () => {
  
  describe('Product add', () => {
    beforeEach(() => {
      cy.visit('/')
    })

    it("Clicks on add to cart", () =>{
      //Click the add button on the first item
      cy.get('button').contains('Add').click({ force: true });
      //confirm that the <a> item that contains my cart now says there is 1 item in cart.
      cy.get('a').contains('My Cart (1)').should('be.visible')
          
    })
    



  })  
})