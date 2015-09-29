#include <iostream>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <Tlhelp32.h>
#include <stdio.h>  /* defines FILENAME_MAX */
#include <typeinfo>

using namespace std;

int main()
{
   PROCESSENTRY32 pEntry;
   HANDLE pSnap;

   pSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
   if (pSnap == INVALID_HANDLE_VALUE)
      return false;
   if (!Process32First(pSnap, &pEntry))
      return false;


   while(Process32Next(pSnap, &pEntry))
   {
      cout << "Dumping Process: " << pEntry.szExeFile
         << " ID : " << pEntry.th32ProcessID
         << "\n" ;
         std::stringstream cmd;
         cmd << ".\\tools\\procdump.exe " << pEntry.th32ProcessID;
         system( cmd.str().c_str() );
   }
   CloseHandle(pSnap);
}
