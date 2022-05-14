//
//  Mocks.swift
//  SwiftUIExample
//
//  Created by Jorge Benavides on 14/05/22.
//

import Foundation

struct Mocks {
    static var fellow = Book(id: UUID().uuidString,
                             title: "The Fellowship of the Ring",
                             author: "J.R.R Tolkien",
                             description: "The future of civilization rests in the fate of the One Ring, which has been lost for centuries. Powerful forces are unrelenting in their search for it. But fate has placed it in the hands of a young Hobbit named Frodo Baggins (Elijah Wood), who inherits the Ring and steps into legend.",
                             price: 18.85,
                             cover: "fellow",
                             stock: 10,
                             tags: ["Fantasy", "Action", "Novel"])

    static var towers = Book(id: UUID().uuidString,
                             title: "The Two Towers",
                             author: "J.R.R Tolkien",
                             description: "The Two Towers opens with the disintegration of the Fellowship, as Merry and Pippin are taken captive by Orcs after the death of Boromir in battle. The Orcs, having heard a prophecy that a Hobbit will bear a Ring that gives universal power to its owner, wrongly think that Merry and Pippin are the Ring-bearers.",
                             price: 11.99,
                             cover: "towers",
                             stock: 7,
                             tags: ["Fantasy", "Action", "Novel"])


    static var homo = Book(id: UUID().uuidString,
                           title: "Homo Deus: A Brief History of Tomorrow",
                           author: "Yuval Noah Harari",
                           description: "Over the past century humankind has managed to do the impossible and rein in famine, plague, and war. This may seem hard to accept, but, as Harari explains in his trademark style—thorough, yet riveting—famine, plague and war have been transformed from incomprehensible and uncontrollable forces of nature into manageable challenges. For the first time ever, more people die from eating too much than from eating too little; more people die from old age than from infectious diseases; and more people commit suicide than are killed by soldiers, terrorists and criminals put together. The average American is a thousand times more likely to die from binging at McDonalds than from being blown up by Al Qaeda.",
                           price: 19.99,
                           cover: "homo",
                           stock: 8,
                           tags: ["Futures studies", "Social philosophy"])


    static var fourhours = Book(id: UUID().uuidString,
                                title: "The 4-Hour WorkWeek",
                                author: "Timothy Ferriss",
                                description: "Forget the old concept of retirement and the rest of the deferred-life plan–there is no need to wait and every reason not to, especially in unpredictable economic times. Whether your dream is escaping the rat race, experiencing high-end world travel, or earning a monthly five-figure income with zero management, The 4-Hour Workweek is the blueprint.",
                                price: 16.15,
                                cover: "4hour",
                                stock: 2,
                                tags: ["Self-actualization", "self-employment", "self-improvement"])

    static var man = Book(id: UUID().uuidString,
                          title: "Man's Search for Meaning",
                          author: "Viktor E. Frankl",
                          description: "At the time of Frankl's death in 1997, Man's Search for Meaning had sold more than 10 million copies in twenty-four languages. A 1991 reader survey for the Library of Congress that asked readers to name a \"book that made a difference in your life\" found Man's Search for Meaning among the ten most influential books in America.",
                          price: 12.25,
                          cover: "man",
                          stock: 15,
                          tags: ["Psychology"])

}
