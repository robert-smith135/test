const path = 'https://www.test.bbc.co.uk/news/localnews';

describe('Location Topic Page', () => {

    it('has radius buttons that redirect as expected', () => {
        cy.server();
        cy.route('https://www.int.bbc.co.uk/news/localnewsdata/2653822/0/50/50').as('getLocalNewsData');
        cy.route('https://www.int.bbc.co.uk/news/localnewsdata/promoted-content/2653822/0').as('getPromotedContentData');

        cy.visit(path + "/2653822-cardiff/0?component-env=int");

        cy.wait('@getLocalNewsData');
        cy.wait('@getPromotedContentData');

        cy.get('.local-news-radius__link').should('have.length', 5);

        cy.get('.local-news-radius__link').eq(4).click();
        cy.url().should('eq', path + '/2653822-cardiff/30');
        cy.get('.local-news-radius__link>a').eq(4).should('be.visible').and('have.class', 'selected');

        cy.get('.local-news-radius__link').eq(3).click();
        cy.url().should('eq', path + '/2653822-cardiff/20');
        cy.get('.local-news-radius__link>a').eq(3).should('be.visible').and('have.class', 'selected');

        cy.get('.local-news-radius__link').eq(2).click();
        cy.url().should('eq', path + '/2653822-cardiff/10');
        cy.get('.local-news-radius__link>a').eq(2).should('be.visible').and('have.class', 'selected');

        cy.get('.local-news-radius__link').eq(1).click();
        cy.url().should('eq', path + '/2653822-cardiff/5');
        cy.get('.local-news-radius__link>a').eq(1).should('be.visible').and('have.class', 'selected');

        cy.get('.local-news-radius__link').eq(0).click();
        cy.url().should('eq', path + '/2653822-cardiff/0');
        cy.get('.local-news-radius__link>a').eq(0).should('be.visible').and('have.class', 'selected');
    });
})
