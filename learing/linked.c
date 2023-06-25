#include<stdio.h>
#include<stdlib.h>


struct node 
{
	int data;
	struct node * next;
};

void insert(struct node **head,int data)
{
	struct node *new;
	new=(struct node *)malloc(sizeof(struct node));
	new->data=data;
	new->next=NULL;
	new->next=*head;
	*head=new;
}


int count(struct node *head)
{
	int c=0;
	if(head==NULL)
	{
		printf("  ");
	}
	else
	{
		struct node *ptr;
		ptr=head;
		while(ptr!=NULL)
		{
			c++;
			ptr=ptr->next;
		}
	}
	return c;
}
int  maxi(struct node *head)
{
	int max=0;
	if(head==NULL)
	{
		printf("  ");
	}
	else
	{
		struct node *ptr;
		ptr=head;
		while(ptr!=NULL)
		{
			if(max < ptr->data)
			{
				max = ptr->data;
			}
			ptr=ptr->next;
		}
	}
	return max;
}




int main()
{

	struct node *head=NULL;
	for(int i=0;i<100;i++)
	{
	insert(&head,i);
	}

	int c;
	c=maxi(head);
	printf("%d",c);


}



