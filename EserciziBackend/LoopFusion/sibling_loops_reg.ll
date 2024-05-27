; ModuleID = 'sibling_loops.ll'
source_filename = "sibling_loops.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @f(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4) #0 {
  br label %6

6:                                                ; preds = %18, %5
  %.01 = phi i32 [ 0, %5 ], [ %19, %18 ]
  %7 = icmp slt i32 %.01, %4
  br i1 %7, label %8, label %20

8:                                                ; preds = %6
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds i32, ptr %1, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds i32, ptr %2, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %11, %14
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds i32, ptr %0, i64 %16
  store i32 %15, ptr %17, align 4
  br label %18

18:                                               ; preds = %8
  %19 = add nsw i32 %.01, 1
  br label %6, !llvm.loop !5

20:                                               ; preds = %6
  br label %21

21:                                               ; preds = %33, %20
  %.0 = phi i32 [ 0, %20 ], [ %34, %33 ]
  %22 = icmp slt i32 %.0, %4
  br i1 %22, label %23, label %35

23:                                               ; preds = %21
  %24 = sext i32 %.0 to i64
  %25 = getelementptr inbounds i32, ptr %0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = sext i32 %.0 to i64
  %28 = getelementptr inbounds i32, ptr %3, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = add nsw i32 %26, %29
  %31 = sext i32 %.0 to i64
  %32 = getelementptr inbounds i32, ptr %3, i64 %31
  store i32 %30, ptr %32, align 4
  br label %33

33:                                               ; preds = %23
  %34 = add nsw i32 %.0, 1
  br label %21, !llvm.loop !7

35:                                               ; preds = %21
  ret void
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"clang version 17.0.6 (https://github.com/llvm/llvm-project/ 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
