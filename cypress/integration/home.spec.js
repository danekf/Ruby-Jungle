context('Window', () => {
  
  describe('Homepage', () => {
    beforeEach(() => {
      cy.visit('/')
    })

    it("There are products on the page", () => {
      cy.get(".products article").should("be.visible");
    });

    it("There are 2 products on the page", () => {
      cy.get(".products article").should("have.length", 2);
    });

    it("Clicks on a product to load page", () =>{
      cy.get('.products article').first().click();
      cy.get('.product-detail').should('be.visible');
      cy.get('.product-detail h1').should('have.text', 'Scented Blade');
    })


  })  
})