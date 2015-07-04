//
//  ListaContatosVC.h
//  iOSCaelum
//
//  Created by ios4729 on 02/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContatoDao.h"
#import "FormularioContatoVC.h"

@interface ListaContatosVC : UITableViewController <FormularioContatoVCDelegate>

@property ContatoDao *dao;
@property Contato *contatoSelecionado;
@property NSInteger linhaDestaque;

@end
