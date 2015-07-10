//
//  ContatoDao.h
//  iOSCaelum
//
//  Created by ios4729 on 02/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Contato.h"

@interface ContatoDao : NSObject

@property (strong, readonly) NSMutableArray *contatos;

- (void) adicionaContato: (Contato *) contato;
+ (id) contatoDaoInstance;
- (Contato *) buscaContatoDaPosicao:(NSInteger)posicao;
- (void) removeContatoDaPosicao:(NSInteger)posicao;
- (NSInteger)buscaPosicaoDoContato:(Contato *)contato;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (Contato *)novoContato;

@end
