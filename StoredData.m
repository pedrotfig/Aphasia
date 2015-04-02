//
//  StoredData.m
//  Aphasia
//
//  Created by Elias Ayache on 30/03/15.
//  Copyright (c) 2015 B-B-BOOM!. All rights reserved.
//

#import "StoredData.h"

@implementation StoredData

static NSMutableArray *categories;

+ (void)restoreToDefaultCategories {
    categories = [[NSMutableArray alloc] init];
    
    //Category 0 -  INICIAL LAYOUT
    
    [self addCategoryWithName:NSLocalizedString(@"TalkToMe", @"Message") andImage:@"EU" andAudio:@"audioTest" andRelations:@[@1 , @4 , @6 , @8]];
    
    //Category 1
    [self addCategoryWithName:NSLocalizedString(@"Me", @"Message") andImage:@"EU" andAudio:@"audioTest" andRelations:nil];
    
    //Category 2
    [self addCategoryWithName:NSLocalizedString(@"Foods", @"Message") andImage:@"BANANA" andAudio:@"audioTest" andRelations:nil];
    
    //Category 3
    [self addCategoryWithName:NSLocalizedString(@"Drinks", @"Message")  andImage:@"AGUA" andAudio:@"audioTest" andRelations:nil];
    
    //Category 4
    [self addCategoryWithName:NSLocalizedString(@"Greetings", @"Message")  andImage:@"OI" andAudio:@"audioTest" andRelations:nil];
    
    //Category 5
    [self addCategoryWithName:NSLocalizedString(@"Pain", @"Message")  andImage:@"BARRIGA" andAudio:@"audioTest" andRelations:nil];
    
    //Category 6
    [self addCategoryWithName:NSLocalizedString(@"Emergency", @"Message")  andImage:@"EMERGENCIA" andAudio:@"audioTest" andRelations:nil];
    
    //Category 7
    [self addCategoryWithName:NSLocalizedString(@"Feelings", @"Message")  andImage:@"FELIZ" andAudio:@"audioTest" andRelations:nil];
    
    //Category 8
    [self addCategoryWithName:NSLocalizedString(@"PersonalNeeds", @"Message")  andImage:@"LAVAR_MAOS" andAudio:@"audioTest" andRelations:nil];
    
    //Category 9
    [self addCategoryWithName:NSLocalizedString(@"Questions", @"Message")  andImage:@"HORAS" andAudio:@"audioTest" andRelations:nil];
    
    
    //Category 0 elements Inicial Board
    
    [[self listOfCategories][0] addElementWithName:NSLocalizedString(@"Me", @"Message") andImage:@"EU"  andAudio:@"audio0"];
    
    [[self listOfCategories][0] addElementWithName:NSLocalizedString(@"Greetings", @"Message")  andImage:@"OI" andAudio:@"audio0"];
    
    [[self listOfCategories][0] addElementWithName:NSLocalizedString(@"PersonalNeeds", @"Message")  andImage:@"LAVAR_MAOS" andAudio:@"audio0"];
    
    
    [[self listOfCategories][0] addElementWithName:NSLocalizedString(@"Questions", @"Message")  andImage:@"HORAS" andAudio:@"audio0"];
    
    
    [[self listOfCategories][0] addElementWithName:NSLocalizedString(@"Emergency", @"Message")  andImage:@"EMERGENCIA" andAudio:@"audio0"];
    
    
    // Category 1 elements me
    [[self listOfCategories][1] addElementWithName:NSLocalizedString(@"Want", @"Message")  andImage:@"QUERO" andAudio:@"audio0"];
    
    [[self listOfCategories][1] addElementWithName:NSLocalizedString(@"Drink", @"Message")  andImage:@"BEBER" andAudio:@"audio0"];
    
    [[self listOfCategories][1] addElementWithName:NSLocalizedString(@"Eat", @"Message")  andImage:@"COMER" andAudio:@"audio0"];
    
    //Category 2 elements foods
    
    [[self listOfCategories][2] addElementWithName:NSLocalizedString(@"Banana", @"Message") andImage:@"BANANA" andAudio:@"audio0"];
    
    [[self listOfCategories][2] addElementWithName:NSLocalizedString(@"Apple", @"Message") andImage:@"MACA" andAudio:@"audio0"];
    
    [[self listOfCategories][2] addElementWithName:NSLocalizedString(@"Bread", @"Message") andImage:@"PAO" andAudio:@"audio0"];
    
    //Category 3 elements drinks
    
    [[self listOfCategories][3] addElementWithName:NSLocalizedString(@"Water", @"Message") andImage:@"AGUA" andAudio:@"audio0"];
    
    [[self listOfCategories][3] addElementWithName:NSLocalizedString(@"Milk", @"Message") andImage:@"LEITE" andAudio:@"audio0"];
    
    [[self listOfCategories][3] addElementWithName:NSLocalizedString(@"Soda", @"Message") andImage:@"REFRIGERANTE" andAudio:@"audio0"];
    
    [[self listOfCategories][3] addElementWithName:NSLocalizedString(@"Juice", @"Message") andImage:@"SUCO" andAudio:@"audio0"];
    
    
    //Category 4 greetings
    [[self listOfCategories][4] addElementWithName:NSLocalizedString(@"Hi", @"Message") andImage:@"OI" andAudio:@"audio0"];
    
    [[self listOfCategories][4] addElementWithName:NSLocalizedString(@"Bye", @"Message") andImage:@"TCHAU" andAudio:@"audio0"];
    
    //Category 5 pain
    [[self listOfCategories][5] addElementWithName:NSLocalizedString(@"Stomachache", @"Message") andImage:@"BARRIGA" andAudio:@"audio0"];
    
    [[self listOfCategories][5] addElementWithName:NSLocalizedString(@"Headache", @"Message") andImage:@"CABECA" andAudio:@"audio0"];
    
    [[self listOfCategories][5] addElementWithName:NSLocalizedString(@"Throat", @"Message") andImage:@"GARGANTA" andAudio:@"audio0"];
    
    //Category 6 emergency
    
    [[self listOfCategories][6] addElementWithName:NSLocalizedString(@"Hospital", @"Message") andImage:@"HOSPITAL" andAudio:@"audio0"];
    
    [[self listOfCategories][6] addElementWithName:NSLocalizedString(@"Police", @"Message") andImage:@"POLICIA" andAudio:@"audio0"];
    
    //Category 7 feellings
    
    [[self listOfCategories][7] addElementWithName:NSLocalizedString(@"Happy", @"Message") andImage:@"FELIZ" andAudio:@"audio0"];
    
    [[self listOfCategories][7] addElementWithName:NSLocalizedString(@"Sad", @"Message") andImage:@"TRISTE" andAudio:@"audio0"];
    
    [[self listOfCategories][7] addElementWithName:NSLocalizedString(@"Sick", @"Message") andImage:@"DOENTE" andAudio:@"audio0"];
    
    
    //Category 8 personal needs
    
    [[self listOfCategories][8] addElementWithName:NSLocalizedString(@"Bathroom", @"Message") andImage:@"BANHEIRO" andAudio:@"audio0"];
    
    [[self listOfCategories][8] addElementWithName:NSLocalizedString(@"BrushTeeth", @"Message") andImage:@"ESCOVAR_DENTES" andAudio:@"audio0"];
    
    [[self listOfCategories][8] addElementWithName:NSLocalizedString(@"WashHands", @"Message") andImage:@"LAVAR_MAOS" andAudio:@"audio0"];
    
    [[self listOfCategories][8] addElementWithName:NSLocalizedString(@"TakeBath", @"Message") andImage:@"TOMAR_BANHO" andAudio:@"audio0"];
    
    
    //Category 9 questions
    
    [[self listOfCategories][9] addElementWithName:NSLocalizedString(@"Time", @"Message") andImage:@"HORAS" andAudio:@"audio0"];
}

+ (void)addCategoryWithName:(NSString *)categoryName andImage:(NSString *)imageName andAudio:(NSString *)audioName andRelations:(NSArray *)accessableCategories{
    [categories addObject:[[AphasiaCategory alloc] initWithName:categoryName andImage:imageName andAudio:audioName andRelations:accessableCategories]];
}

+ (void)removeCategoryWithIndex:(NSUInteger)categoryIndex {
    [categories removeObjectAtIndex:categoryIndex];
}

+ (NSArray *)listOfCategories {
    if ([categories count] > 0) return categories;
    else return [[NSArray alloc] init];
}

+ (AphasiaCategory *)getCategoryAtIndex:(NSUInteger)categoryIndex {
    return [self listOfCategories][categoryIndex];
}


@end
