#import "Person.h"
#import "AppDelegate.h"
#import "Examples.h"


@implementation Examples
{

}

+ (void)showSubscriptExamples
{
//	[self oldDictionaryWay];
//	[self dictionaryShortcut];
//	[self oldArrays];
//	[self newArrays];
//	[self likeNewDictionaries];
//	[self dotSyntax];
	[self totalSubScriptingAwesomeness];

}

+ (void)totalSubScriptingAwesomeness
{

	Person *person = [Person new];
	person[kFirstNameKey] = @"Tim";
	person[kLastNameKey] = @"Cook";

	NSString *firstNameByKey = person[kFirstNameKey];
	NSString *lastNameByKey = person[kLastNameKey];

	NSString *firstNameByIndex = person[0];
	NSString *lastNameByIndex = person[1];


	if ( [firstNameByKey isEqualToString:firstNameByIndex] &&
		 [lastNameByKey isEqualToString:lastNameByIndex] )
	{
		NSLog(@"Success.  It conforms.");
	}
	else
	{
		NSLog(@"Something is not right.");
	}
}

+ (void)dotSyntax
{
	Person *person = [Person new];
	person.firstName = @"Tim";
	person.lastName = @"Cook";
	NSString *firstName = person.firstName;
	NSString *lastName = person.lastName;
}

+ (void)likeNewDictionaries
{

	Person *person = [Person new];
	person[kFirstNameKey] = @"Tim";
	person[kLastNameKey] = @"Cook";

	NSString *firstName = person[kFirstNameKey];
	NSString *lastName = person[kLastNameKey];

}

+ (void)oldDictionaryWay
{
	NSMutableDictionary *dictionary = @{}.mutableCopy;
	[dictionary setValue:@"Tim" forKey:kFirstNameKey];
	[dictionary setValue:@"Cook" forKey:kLastNameKey];
	NSString *firstName1 = [dictionary valueForKey:kFirstNameKey];
	NSString *lastName1 = [dictionary valueForKey:kLastNameKey];
}

+ (void)dictionaryShortcut
{

	NSDictionary *dictionary = @{
			kFirstNameKey : @"Tim",
			kLastNameKey : @"Cook",
	};

	NSString *firstName = dictionary[kFirstNameKey];
	NSString *lastName = dictionary[kLastNameKey];

}

+ (void)oldArrays
{

	NSArray *array = [[NSArray alloc] initWithObjects:@"Tim", @"Cook", nil];
	NSString *firstItem = [array objectAtIndex:0];
	NSString *secondObject = [array objectAtIndex:1];

}

+ (void)newArrays
{
	NSArray *array = @[@"Tim", @"Cook"];
	NSString *firstItem = array[0];
	NSString *secondObject = array[0];
}

@end